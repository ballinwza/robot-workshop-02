# ------ Robot Command ------ #

create-lib:
	pip freeze > requirements.txt
	
install:
	pip install -r requirements.txt

create-graph:
	robotmetrics

run:
	robot all_online_search_success.robot

create-env-win:
	python -m venv .venv

create-env-os:
	python3 -m venv .venv	

open-graph:
	open metrics-20250124-182953.html

open-log:
	open report.html