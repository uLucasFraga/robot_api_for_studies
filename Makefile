clean:
	rm -fr .tox/
	rm -f .coverage
	rm -fr htmlcov/
	rm -rf log* logs output* report*

install:
	pip3 install -r requirements.txt

run-serverest:
	npx serverest -t 600000 -p 3000

run-regression:
	robot -d ./logs -i @regression .

run-smoke:
	robot -d ./logs -i @smoke .

run-login:
	robot -d ./logs -i @login .

run-products:
	robot -d ./logs -i @products .

run-carts:
	robot -d ./logs -i @carts .

run-users:
	robot -d ./logs -i @users .