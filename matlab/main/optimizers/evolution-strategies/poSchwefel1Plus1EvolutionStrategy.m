function searchResults = poSchwefel1Plus1EvolutionStrategy(...
    problemParameters, optimizerOptions)
% Schwefel's (1+1)-evolution strategy.
%
% Input ->
%   problemParameters : problem parameters, specified as a structure scalar.
%   optimizerOptions  : optimizer options, specified as a structure scalar.
% Output <-
%   searchResults : search results, specified as a structure scalar.
%
% Reference:
%   Back, T., Hoffmeister, F. and Schwefel, H.P., 1991, July.
%   A survey of evolution strategies. In Proceedings of the Fourth
%   International Conference on Genetic Algorithms (Vol. 2, No. 9).
%   Morgan Kaufmann Publishers, San Mateo, CA.
startTime = tic;

% load and check problem parameters
[problemParameters, name, dimension, upperBounds, lowerBounds] = ...
    poCheckProblemParameters(problemParameters);

% load and check optimizer options
[optimizerOptions, maximumEvaluations, maximumRuntime, thresholdFitness, ...
    ~, stepSize] = poCheckRechenberg1Plus1EvolutionStrategy(...
    problemParameters, optimizerOptions);

% initialize population (i.e., x)
x = poInitializePopulation(problemParameters, optimizerOptions);

% initialize `optimalSolution` and `optimalFitness`
optimalSolution = x;
startEvaluations = tic;
optimalFitness = feval(name, optimalSolution);
timeEvaluations = toc(startEvaluations);
numberEvaluations = 1;
evaluations = optimalFitness;

% initilize parameters for step-size adjustment
ratioIncrease = 1 / 0.82; % ratio to increase step-size
ratioDecrease = 0.82; % ratio to decrease step-size
numberSuccess = 0; % number of successful mutations

% iteratively optimize
numberIterations = 1;
stoppingFlag = 'maximumEvaluations';
while numberEvaluations < maximumEvaluations
    if toc(startTime) >= maximumRuntime
        stoppingFlag = 'maximumRuntime';
        break;
    end
    
    if optimalFitness <= thresholdFitness
        stoppingFlag = 'thresholdFitness';
        break;
    end
    
    % adjust step-size every `dimension` mutations (via the 1/5 success rule)
    if (numberEvaluations > 1) && ~rem(numberEvaluations - 1, dimension)
        if numberSuccess > (1 / 5) * dimension
            stepSize = ratioIncrease * stepSize;
        elseif numberSuccess < (1 / 5) * dimension
            stepSize = ratioDecrease * stepSize;
        end
        numberSuccess = 0;
    end
    
    % mutate the best-so-far solution
    x = optimalSolution + normrnd(zeros(dimension, 1), stepSize);
    outOfBound = (x > upperBounds) | (x < lowerBounds);
    if any(outOfBound)
        x(outOfBound) = unifrnd(lowerBounds(outOfBound), upperBounds(outOfBound));
    end
    
    % evaluate fitness of new sample (i.e., y)
    startEvaluations = tic;
    y = feval(name, x);
    timeEvaluations = timeEvaluations + toc(startEvaluations);
    numberEvaluations = numberEvaluations + 1;
    evaluations = cat(2, evaluations, y);
    
    % update `optimalSolution` and `optimalFitness`
    if optimalFitness > y
        optimalFitness = y;
        optimalSolution = x;
        numberSuccess = numberSuccess + 1;
    end
    
    numberIterations = numberIterations + 1;
end

% return final search results
searchResults.optimalFitness = optimalFitness;
searchResults.optimalSolution = optimalSolution;
searchResults.numberEvaluations = numberEvaluations;
searchResults.numberIterations = numberIterations;
searchResults.timeEvaluations= timeEvaluations;
searchResults.evaluations = evaluations;
searchResults.stoppingFlag = stoppingFlag;
searchResults.problemParameters = problemParameters;
searchResults.optimizerOptions = optimizerOptions;
searchResults.runtime = toc(startTime);
end
