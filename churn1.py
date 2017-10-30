#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Oct 30 17:43:33 2017

@author: deepanchakravarthi
"""

"""

Importing libraries
"""
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

#importing the dataset

dataset=pd.read_csv('CustomerChurn.csv')
x= dataset.iloc[:,:-1]
y= dataset.iloc[:,20].values #this line returns an array instead of dataframe


#Checking if there are any missing values 

dataset.isnull().any()

#no missing values

