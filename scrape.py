from selenium import webdriver
from tqdm import tqdm

driver = webdriver.Chrome()

driver.get('localhost:8000/main.elm')
driver.implicitly_wait(10)

def namer():
    for x in range(100):
        yield "screenshot{}.png".format(x)

svg = driver.find_element_by_tag_name("svg")

for name in tqdm(namer()):
    driver.save_screenshot('./screenshots/' + name)
    svg.click()
