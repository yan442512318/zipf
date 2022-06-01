import pandas as pd

input_csv = 'results/jane_eyre.csv'

df = pd.read_csv(input_csv, header=None, names=['word', 'word_frequency'])

df['rank'] = df['word_frequency'].rank(ascending=False, method='max')

df['inverser_rank'] = 1/df['rank']
scatterplot = df.plot.scatter(x='word_frequency',y='inverser_rank', figsize=[12,6],grid=True)
fig = scatterplot.get_figure()
fig.savefig('results/jane_eyre.png')