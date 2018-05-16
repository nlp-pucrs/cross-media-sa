import pandas as pd
from liwc import LIWC
liwc_class = LIWC()

posts = pd.read_csv('blogset-br.csv.gz', compression='gzip', header=None)

tier16_list = pd.read_csv('post.log', header=None)
tier16_posts = posts[posts[0].isin(tier16_list[0].values)]

mtx = liwc_class.build_features(tier16_posts[4].values)