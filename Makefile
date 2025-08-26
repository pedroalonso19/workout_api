run:
	@uvicorn workout_api.main:app --reload --port 8001

create-migrations:
	@set PYTHONPATH=%PYTHONPATH%;%cd% && alembic revision --autogenerate -m $(d)

run-migrations:
	@set PYTHONPATH=%PYTHONPATH%;%cd% && alembic upgrade head
