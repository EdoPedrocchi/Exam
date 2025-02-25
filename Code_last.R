rm(list = ls())


library(readxl)  
library(ggplot2) 
library(dplyr)   
library(tidyr)   



library(caret)
library(data.table)


library(ROCR)
library(rpart) 
library(partykit) 
library(rattle) 
library(rpart.plot) 
library(ROCR) 
library(randomForest) 
library(rpart.plot)
library(rattle) 

library(tidyverse)
library(caret)
library(randomForest)
library(neuralnet)
library(pROC)


  library(bayestestR)
library(rstanarm)
library(LearnBayes
library(lattice)

dataset_path <- "/Users/pedrocchiedoardo/Desktop/esame statistical learning/Dataset2_Companies.xlsx"


data <- read_excel(dataset_path)
data<-as.data.frame(data)



library(nnet)
library(neuralnet)


##########################
########################## 
####### EDA ############## 
##########################
##########################

print(head(data))

data$ID <- NULL

print(colnames(data))
print(head(data))
print(sum(is.na(data))) 
summary(data)
attach(data)



# default rate
def_perc<-sum(data$Flag)/length(data$Flag)
print(def_perc)


numeric_columns <- names(data)[sapply(data, is.numeric)]

#plots
for (col in numeric_columns) {
  print(
    ggplot(data, aes(x = .data[[col]])) +
      geom_histogram(bins = 30, fill = "blue", alpha = 0.6) +
      labs(title = col, x = col, y = "Frequenza") +
      theme_minimal()
  )
  Sys.sleep(1)  
}

  for (col in numeric_columns) {
    print(
      ggplot(data, aes(y = .data[[col]])) +
        geom_boxplot(fill = "lightblue", outlier.color = "red", outlier.shape = 16) +
        labs(title = paste("Boxplot di", col), y = col) +
        theme_minimal()
    )
    Sys.sleep(1)  
  }
    
cor(data[, sapply(data, is.numeric)])
    
    correlation_matrix <- cor(data[, sapply(data, is.numeric)])
    print(correlation_matrix)
    

    heatmap(correlation_matrix, main="correlation matrix", col=heat.colors(10))
    
    
    
    ############Financial Learning#########
    
   
    
    # Transform "Default" in factor
    data$Flag<-as.factor(data$Flag)

    
    # Split the dataset into training and testing samples 
    # use Stratified Sampling 


    set.seed(300)
    perc<-0.7
    div<-createDataPartition(y=data$Flag,p=perc,list=F)
    
    
    data.train_1<-data[div,] # 70% here
  
    data.test_1<-data[-div,] # the rest of the data goes here
   
    ##########################
    #1. logistic regression
    ##########################
        
    ### MODEL WITH ALL VARIABLES 
    fit1<-glm(Flag~.,data=data.train_1,family=binomial())
    summary(fit1)
    
    ## Odds ratios 
    exp(coefficients(fit1))
    
    ## Get predicted default probabilities
    data.test_1$score<-predict(fit1,type='response',data.test_1)
    
    # Decide a cut-off and get predictions
    cut_off<-def_perc
    data.test_1$pred<-ifelse(data.test_1$score<=cut_off,0,1)
  
    ##false positive rate
    n_neg<-nrow(data.test_1[data.test_1$Flag=='0',])
    data.test_1$fp_flag<-ifelse(data.test_1$pred==1 & data.test_1$Flag=='0',1,0)
    fpr<-sum(data.test_1$fp_flag)/n_neg #false positive rate
    
    ##false negative rate
    n_pos<-nrow(data.test_1[data.test_1$Flag=='1',])
    data.test_1$fn_flag<-ifelse(data.test_1$pred==0 & data.test_1$Flag=='1',1,0)
    fnr<-sum(data.test_1$fn_flag)/n_pos #false negative rate
    
    ##sensitivity
    1-fnr
    
    ##specificity
    1-fpr
    
    
    ##########################
    #2. Stepwise regression
    ##########################
        
    fit_step<-step(fit1,direction='both')
    summary(fit_step)
    
    ##ANOVA
    anova(fit_step,fit1,test="Chisq")
    
    ## Get predicted default probabilities
    data.test_1$score<-predict(fit_step,type='response', data.test_1)
    data.test_1$score1<-predict(fit1,type='response', data.test_1)
    
    ## Plot AUROC
    perf_auroc<-performance(prediction(data.test_1$score, data.test_1$Flag),"auc")
    auroc<-as.numeric(perf_auroc@y.values)
    
    perf_plot<-performance(prediction(data.test_1$score, data.test_1$Flag),"tpr","fpr")
    plot(perf_plot,main='ROC',col='blue',lwd=2)
    
    ## Compare AUROC
 
    perf_auroc1<-performance(prediction( data.test_1$score1, data.test_1$Flag),"auc")
    auroc1<-as.numeric(perf_auroc1@y.values)
    
    perf_plot1<-performance(prediction( data.test_1$score1, data.test_1$Flag),"tpr","fpr")
    
    plot(perf_plot,main='ROC',col='blue',lwd=2)
    plot(perf_plot1,add=TRUE,col='red',lwd=2) 
    legend("right",legend=c("Model from stepwise","Full model"),lty=(1:1),col=c("blue","red"))
    
    
    
    ##########################
    ######tree 
    ##########################
        
    #CART decision tree (minimizes the Gini impurity in each group)

    #remember to change name

    fit1<-rpart(Flag~.,data=data.train,method="class")
    
    # Print tree detail
    printcp(fit1)
    
    # Plot the tree
    plot(fit1,margin=0.2,main="Tree: Recursive Partitioning")
    text(fit1,cex=0.8) 
    
    prp(fit1,type=2,extra=1,main="Tree: Recursive Partitioning") # type=2 draws the split labels below the node labels
    # extra=1 displays the number of observations that fall in the node 
    fancyRpartPlot(fit1)
    
    # Make predictions on the test sample
    data.test$fit1_score<-predict(fit1,type='prob',data.test)
    fit1_pred<-prediction(data.test$fit1_score[,2],data.test$Flag)
    fit1_perf<-performance(fit1_pred,"tpr","fpr")
    
    # Model performance plot
    plot(fit1_perf,lwd=2,colorize=TRUE,main="ROC Fit1: Recursive Partitioning")
    lines(x=c(0,1),y=c(0,1),col="red",lwd=1,lty=3)
    
    
    
    
    
    
    library(party)
    # AUROC, KS and GINI
    # The KS statistic is the maximum difference between the cumulative percentage of "yes" (cumulative true positive rate)
    # and the cumulative percentage of "no" (cumulative false positive rate)
    # The Gini coefficient is measured in values between 0 and 1, where a score of 1 means that the model is 100% accurate
    # in predicting the outcome, While a Gini score equal to 0 means that the model is entirely inaccurate (random model).
    
    ###remember to change variables
    fit1_AUROC<-round(performance(fit1_pred,measure="auc")@y.values[[1]]*100,2)
    fit1_KS<-round(max(attr(fit1_perf,'y.values')[[1]]-attr(fit1_perf,'x.values')[[1]])*100,2)
    fit1_Gini<-(2*fit1_AUROC-100)
    CART_tree<-cat("AUROC:",fit1_AUROC,"KS:",fit1_KS,"Gini:",fit1_Gini)
    

    fit2<-ctree(Flag~.,data=data.train)
    fit2
    summary(fit2)
    
    
    # This is  a decision tree but with extra information in the terminal nodes.
    plot(fit2,gp=gpar(fontsize=6),ip_args=list(abbreviate=FALSE,id=FALSE))
    
    
    
    
    # Make predictions on the test sample
    data.test$fit2_score<-predict(fit2,type='prob',data.test)
    fit2_pred<-prediction(data.test$fit2_score[,2],data.test$Flag)
    fit2_perf<-performance(fit2_pred,"tpr","fpr")
    
    # Model performance plot
    plot(fit2_perf,lwd=2,colorize=TRUE,main="ROC Fit2: Conditional Inference Tree")
    lines(x=c(0,1),y=c(0,1),col="red",lwd=1,lty=3)
    
    #  AUROC, KS and GINI
    fit2_AUROC<-round(performance(fit2_pred, measure = "auc")@y.values[[1]]*100,2)
    fit2_KS<-round(max(attr(fit2_perf,'y.values')[[1]]-attr(fit2_perf,'x.values')[[1]])*100,2)
    fit2_Gini<-(2*fit2_AUROC-100)
    cond_inf_tree<-cat("AUROC:",fit2_AUROC,"KS:",fit2_KS,"Gini:",fit2_Gini)
    
    
    
      ####################
      #2. RANDOM FOREST
      ####################
  
    fit3<-randomForest(Flag~.,data=data.train_1,na.action=na.roughfix)
    
    fit3_fitForest<-predict(fit3,newdata=data.test_1,type="prob")[,2]
    fit3_fitForest.na<-as.data.frame(cbind( data.test_1$Flag,fit3_fitForest))
    colnames(fit3_fitForest.na)<-c('Flag','pred')
    fit3_fitForest.narm<-as.data.frame(na.omit(fit3_fitForest.na)) # remove NA (missing values)
    
    fit3_pred<-prediction(fit3_fitForest.narm$pred,fit3_fitForest.narm$Flag)
    fit3_perf<-performance(fit3_pred,"tpr","fpr")
    
    #Plot variable importance
    varImpPlot(fit3,main="Random Forest: Variable Importance")
    
    # Model Performance plot
    plot(fit3_perf,colorize=TRUE,lwd=2,main="fit3 ROC: Random Forest",col="blue")
    lines(x=c(0,1),y=c(0,1),col="red",lwd=1,lty=3)
    
    # AUROC, KS and GINI
    ##cambiare valori
    fit3_AUROC<-round(performance(fit3_pred, measure="auc")@y.values[[1]]*100,2)
    fit3_KS<-round(max(attr(fit3_perf,'y.values')[[1]]-attr(fit3_perf,'x.values')[[1]])*100,2)
    fit3_Gini<-(2*fit3_AUROC-100)
    rand_for<-cat("AUROC:",fit3_AUROC,"KS:",fit3_KS,"Gini:",fit3_Gini)
    
    
   
    summary(fit3)
    importance(fit3)
    fit3_pred
    fit3_perf
    
    accuracy <- sum(diag(fit3$confusion)) / sum(fit3$confusion)
    cat("Accuracy:", round(accuracy * 100, 2), "%")
    

    ###########################
    ##### 4.NEURAL NETWORK #####
    ###########################
    
    
    library(readr)     # Load readr for data handling
    library(nnet)      # Load nnet for neural network functions
    library(neuralnet) # Load neuralnet for training neural networks
    

    # Train a neural network model on the dataset with normalized data
    
    # Definizione della funzione di standardizzazione
    standardize <- function(x, mean_val, sd_val) {
      return ((x - mean_val) / sd_val)
    }
    
    features <- setdiff(names(data.train_1), "Flag")
   
    mean_vals <- sapply(data.train_1[, features], mean)
    sd_vals <- sapply(data.train_1[, features], sd)
    

    data.train_1.std <- data.train_1  # Copia il dataset originale
    data.train_1.std[, features] <- scale(data.train_1[, features], center = mean_vals, scale = sd_vals)
    
   
    data.test_1.std <- data.test_1  
    data.test_1.std[, features] <- scale(data.test_1[, features], center = mean_vals, scale = sd_vals)
    
    # Check
    summary(data.train_1.std)
    summary(data.test_1.std)
    
    
    apply(data.train_1.std[, features], 2, sd)  
    apply(data.test_1.std[, features], 2, sd)   # similar to zero 
    
  
    
    nn <- neuralnet(Flag ~ ., data=data.train_1.std,
                    hidden=c(5, 3), 
                    act.fct="logistic",  # Use logistic activation function
                    err.fct='ce',  # Use cross-entropy error function
                    linear.output=FALSE,  # Output is categorical, not continuous
                    lifesign="minimal", # Show minimal training progress output
                    stepmax = 1e6)
    # Plot the trained neural network model
    plot(nn)
    
    ##### Compute predictions #####
    # Generate predictions on the test dataset
    nn_pred <- compute(nn, data.test_1.std[, -which(names(data.test_1) == "Flag")])
    
    # Extract predicted results
    nn_pred1 <- nn_pred$net.result
    
    # Convert predictions to class labels
    predicted <- ifelse(nn_pred1 > 0.5, 1, 0)
    
    # Evaluate accuracy
    accuracy <- mean(predicted == as.numeric(as.character(data.test_1$Flag)))  # Compute accuracy
    print(accuracy)  # Print the accuracy of the model
    
    ##### Cross-validation #####
    # Initialize an empty vector to store accuracy results
    outs <- NULL
    
    # Define number of folds for cross-validation
    k <- 10  # 10-fold cross-validation
    set.seed(123)  # Set seed for reproducibility
    
    # Perform k-fold cross-validation
    for(i in 1:k) {
      index <- sample(1:nrow(train), round(0.8 * nrow(train)))  # Randomly select training indices
      train_cv <- train[index, ]  # Create training subset
      test_cv <- train[-index, ]  # Create testing subset
      
      # Train neural network on training subset
      nn_cv <- neuralnet(Flag ~ ., data=train_cv,
                         hidden=c(5),  # Use the same hidden layer configuration
                         act.fct="logistic",  # Use logistic activation function
                         err.fct="ce",  # Use cross-entropy error function
                         linear.output=FALSE)  # Categorical output
      
      
      

      
      
      
     ##########modificare#############

      
      # Generate predictions on the test set
      nn_pred <- compute(nn_cv, test_cv[, -which(names(test_cv) == "Flag")])
      
      # Extract predicted results
      nn_pred1 <- nn_pred$net.result
      
      # Convert predictions to class labels
      predicted <- ifelse(nn_pred1 > 0.5, 1, 0)
      
      # Evaluate accuracy
      outs[i] <- mean(predicted == as.numeric(as.character(data.test_1$Flag)))  # Store accuracy result
    }
    
    # Compute and print the mean accuracy across all folds
    print(mean(outs))
    
    
#####SAFE AI ######
        
    
    #########################Bayesian Learning######################################################
    #######################################################
        
  
    
    # Define the prior (Student's t with df=7, location=0, scale=2.5)
    t_prior <- student_t(df = 7, location = 0, scale = 2.5)
    
    # Fit Bayesian logistic regression using MCMC
    fit <- stan_glm(Flag ~ .,  # Use all predictors in 'data' to predict 'Flag'
                    data = data, 
                    family = binomial(link = "logit"),  # Logistic regression
                    prior = t_prior, 
                    prior_intercept = t_prior,
                    seed = 12345)
    
    # Summary of the model
    summary(fit, digits=3)
    
    # Get 50% credible intervals for coefficients
    round(posterior_interval(fit, prob = 0.5), 3)
    
    # Extract and plot residuals
    residuals <- residuals(fit)
    plot(residuals, type='l', main="Residuals of Bayesian Logistic Regression")
    
    # Check model diagnostics
    library(bayesplot)
    mcmc_dens(fit)  # Density plot of posterior distributions
    hdi(fit)  # Highest Density Interval (credible intervals)
    
    
    
    ##logisitc regression  to make predictions
    
    
    
    fit <- stan_glm(Flag ~ .,  # Use all predictors in 'data.train_1' to predict 'Flag'
                    data = data.train_1, 
                    family = binomial(link = "logit"),  # Logistic regression
                    prior = t_prior, 
                    prior_intercept = t_prior,
                    seed = 12345)
    
    # Summary of the model
    summary(fit, digits=3)
    
    # Get 50% credible intervals for coefficients
    round(posterior_interval(fit, prob = 0.5), 3)
    
    # Extract and plot residuals
    residuals <- residuals(fit)
    plot(residuals, type='l', main="Residuals of Bayesian Logistic Regression")
    
    # Check model diagnostics
    mcmc_dens(fit)  # Density plot of posterior distributions
    hdi(fit)  # Highest Density Interval (credible intervals)
    
    # Make predictions on new dataset (data.test_1)
    predicted_probs <- posterior_predict(fit, newdata = data.test_1)
    predicted_mean_probs <- colMeans(predicted_probs)  # Mean probability estimates
    
    # Convert probabilities to class labels
    predicted_classes <- ifelse(predicted_mean_probs > 0.5, 1, 0)
    
    # Evaluate model performance
    conf_matrix <- table(Predicted = predicted_classes, Actual = data.test_1$Flag)
    accuracy <- sum(diag(conf_matrix)) / sum(conf_matrix)
    
    # Print results
    print(conf_matrix)
    print(paste("Accuracy:", round(accuracy * 100, 2), "%"))
    
    
    
    
    
    ##Naive Bayes classifier
    library(e1071)
    
    
    nb_model <- naiveBayes(Flag ~ ., data = data.train_1)
    
    # Make predictions3
    predictions <- predict(nb_model, data.test_1)
    
    # Evaluate model accuracy
    conf_matrix <- table(Predicted = predictions, Actual = data.test_1$Flag)
    accuracy <- sum(diag(conf_matrix)) / sum(conf_matrix)
    
    # Print results
    print(conf_matrix)
    print(paste("Accuracy:", round(accuracy * 100, 2), "%"))
    
    print(nb_model)
    
    nb_model$apriori
    nb_model$tables
    

    confusionMatrix(as.factor(predictions), as.factor(data.test_1$Flag))
    
    
