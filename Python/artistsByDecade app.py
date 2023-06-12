#!/usr/bin/env python
# coding: utf-8

# In[1]:


import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns


# In[13]:


#Export excel sheet into jupyter
#Drop Explicit column, all values returns gave us 0's 
df = pd.read_excel("artistsByDecadeClean.xlsx")
df = df.drop('explicit', axis=1)
df


# In[14]:


#Pairplot to find what graphs we can dive deeper in
sns.pairplot(df, corner = True)
plt.show()


# In[20]:


#Using heatmap to better find correlations. 
sns.heatmap(np.round(df.corr(), 2), annot = True);


# # Findings
# All cleaning was done using excel. I implemented Python to better find the correlations between the different columns. My next step is to take the columns with the highest K values into Tableau to better plot them and support my analysis.
# 
# #### Columns over to Tableau: any >=.75 AND <= -.5
# -Danceability/Acoustic
# 
# -energy/loudness
# 
# -energy/acousticness
# 
# -loudness/acousticness
# 
# -danceabiklity/valence
