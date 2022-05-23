import sys
import numpy as np
from sklearn.model_selection import train_test_split
from sklearn.feature_extraction.text import CountVectorizer
from nltk.stem import WordNetLemmatizer
from sklearn.naive_bayes import MultinomialNB
from sklearn.metrics import confusion_matrix
from sklearn import metrics
import re
import nltk
from sklearn.metrics import accuracy_score

def getTrainSet(trainSetFile):
    trainDataSet = {} 
    f=open(trainSetFile, 'r')
    for l in f.readlines():
        label = re.compile('\t').split(l.strip())[0]
        question = re.compile('\t').split(l.strip())[1]
        answer = re.compile('\t').split(l.strip())[2]
        #put question and answer together
        qa = question.strip() + ' ' + answer.strip()
        trainDataSet[qa] = [label]
    return trainDataSet

def preProcessing(dataset, sentence = None):
    dataSetPreProcessed = {}
    if sentence:
        return deletePunctuation(deletePunctuation(stemming(lemmatization(sentence))))
    else:
        for qa, label in dataset.items():
                #lowercasting and remove pounctuation
                new_qa = deletePunctuation(qa)
                #remove stop words
                new_qa =deleteStopWords(new_qa)
                #stemming
                new_qa = stemming(new_qa)
                #lemmatization
                new_qa = lemmatization(new_qa)
                #add to dataSetPreProcessed
                dataSetPreProcessed[new_qa] = label
        return dataSetPreProcessed

def deletePunctuation(sentence):
    sentence = nltk.word_tokenize(sentence)
    new_sentence_without_Pounctuation = ' '.join(map(str, [token.lower() for token in sentence if token.isalpha()])) 
    return new_sentence_without_Pounctuation

def deleteStopWords(sentence):
    #stopwords = nltk.corpus.stopwords.words('english')
    #stop words more common obtained through stopWordsMoreCommon function
    mostCommonStopWordsInTrainSet = ['the', 'of', 'this', 'in', 'a', 'to', 'was', 'is', 'for', 'on']
    sentence_as_list = list(sentence.split(" "))
    sentence_without_stopwords = ' '.join(map(str,[token for token in sentence_as_list if token not in mostCommonStopWordsInTrainSet ]))
    return sentence_without_stopwords

def stemming(sentence):
    stemmer = nltk.stem.PorterStemmer()
    tokens = tokenization(sentence)
    return ' '.join(stemmer.stem(token) for token in tokens)

def lemmatization(sentence):
    lemmatizer =  WordNetLemmatizer()
    tokens = tokenization(sentence)
    return ' '.join(lemmatizer.lemmatize(token) for token in tokens if len(token)>2)

def tokenization(sentence):
    tokenizer = nltk.tokenize.TreebankWordTokenizer()
    tokens = tokenizer.tokenize(sentence.strip())
    return tokens

def getQA_LabelDict(datasetPreprocessed):
    qaList = []
    labelList = []
    for qa, label in datasetPreprocessed.items():
        qaList.append(qa)
        labelList.append(label)
    return qaList, labelList

def getFileResults(file):
    f=open(file, 'r')
    for l in f.readlines():
        if(len(re.compile('\t').split(l.strip())) == 3):
            question = re.compile('\t').split(l.strip())[1]
            answer = re.compile('\t').split(l.strip())[2]
            label = model.predict(vec.transform([preProcessing(dataset = None, sentence = question).strip() + ' ' + preProcessing(dataset = None, sentence = answer).strip()]))
            print(str(label[0]).strip())
        else:
            question = re.compile('\t').split(l.strip())[0]
            answer = re.compile('\t').split(l.strip())[1]
            label = model.predict(vec.transform([preProcessing(dataset = None, sentence = question).strip() + ' ' + preProcessing(dataset = None, sentence = answer).strip()]))
            print(str(label[0]).strip())

def stopWordsMoreCommon(dataset):
    stopwords = nltk.corpus.stopwords.words('english')
    commonWords = {}
    for qa in dataset.keys():
        qaList = qa.split()
        for qa in qaList:
            if qa in stopwords:
                if qa not in list(commonWords.keys()):
                    commonWords[qa] =1
                else:
                    num = commonWords[qa]
                    num = num +1
                    commonWords[qa] = num
    commonWordsSorted = sorted(commonWords.items(), key=lambda x: x[1], reverse=True) 
    mostCommonTokens = []
    for token in commonWordsSorted:
        mostCommonTokens.append(token[0])
    return commonWordsSorted

if __name__ == "__main__":

    #get data set to be training
    trainDataSet = getTrainSet(sys.argv[4])
    #most common stop word in dataset
    #stopWordsMoreCommon(trainDataSet)
    
    #processing data set
    trainDataSetPreProcessed = preProcessing(trainDataSet, sentence = None)
    #get question/answer list and label list
    qaList, labelList = getQA_LabelDict(trainDataSetPreProcessed)
    # Vectorize text reviews to numbers
    vec = CountVectorizer()
    #fit transform
    qaList = vec.fit_transform(qaList).toarray()
    #MultinomialNB model    
    model = MultinomialNB()
    model.fit(qaList, np.ravel(labelList,order='C') )
    
    getFileResults(sys.argv[2])

    #Used to evaluation metrics
    """
    X_train, X_test, y_train, y_test = train_test_split(qaList, labelList, test_size = 0.3, random_state = 0)
    y_pred = model.predict(X_test)

    accuracy = accuracy_score(y_test, y_pred) 
    print("accurancy ", accuracy)
    # predicting test set results
    #y_pred = model.predict(X_test)
    
    # making the confusion matrix
    cm = confusion_matrix(y_test, y_pred)
    print(cm) 
    print(metrics.classification_report(y_test, y_pred, target_names=['SCIENCE', 'GEOGRAPHY', 'HISTORY', 'LITERATURE', 'MUSIC']))
    
    print('\nTrue Positives(TP) = ', cm[0,0])
    print('\nTrue Negatives(TN) = ', cm[1,1])
    print('\nFalse Positives(FP) = ', cm[0,1])
    print('\nFalse Negatives(FN) = ', cm[1,0])
    """







 
