from tqdm import tqdm
from os import path
import os
from bs4 import BeautifulSoup

pages_dir = path.join(path.dirname(path.abspath(__file__)), '..', 'data', 'pages')
page_paths = list(map(lambda x: path.join(pages_dir, x), os.listdir(pages_dir)))

err_cnt = 0

for page_path in tqdm(page_paths):
    try:
        soup = BeautifulSoup(open(page_path), 'lxml')
        node = soup.find('h1')
        # if node is not None:
        #     print(node.text)
        # node = soup.find('option')
        # if node is not None:
        #     print(node.text)
    except KeyboardInterrupt:
        break
    except:
        err_cnt += 1

print('err_cnt: {0}'.format(err_cnt))
