from tqdm import tqdm
from os import path
import os
from bs4 import BeautifulSoup

pages_dir = path.join(path.dirname(path.abspath(__file__)), '..', 'data', 'pages')
page_paths = list(map(lambda x: path.join(pages_dir, x), os.listdir(pages_dir)))

for page_path in tqdm(page_paths):
    soup = BeautifulSoup(open(page_path), 'lxml')

