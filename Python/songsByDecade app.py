#!/usr/bin/env python
# coding: utf-8

# In[1]:


import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns


# In[3]:


df = pd.read_excel("songsByDecadeClean.xlsx")
df.head()


# In[5]:


sns.pairplot(df, corner = True)
plt.show()


# In[8]:


sns.heatmap(np.round(df.corr(), 1), annot = True, cmap = 'crest');


# # Findings from above
# Hard to tell the exact numbers but based off colors I want to dive deeper into these columns:
# 
# -Energy/Acoustic
# 
# -Acoustic/Loudness
# 
# -Dance/Valence
# 
# -Loudness/Energy
# 
# -explicit/Speech and year
# 
# -acoustic/track num?
