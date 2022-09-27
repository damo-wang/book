#!/usr/bin/python3

import streamlit as st
import pandas as pd

st.write("""
# My First app
Hello *world!*
""")

df=pd.read_csv("my_data.csv")
st.bar_chart(df)
