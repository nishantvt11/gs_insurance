# GS Insurance Data Model
 GS Insurance finance data model

## 📦 Dependency Management

This project uses [Poetry](https://python-poetry.org/) for managing dependencies, virtual environments, and packaging.

### 🔧 Prerequisites

Make sure you have Poetry installed:

```bash
pip install poetry
```

## Instructions

### 1. Clone the repo:

```bash
git clone https://github.com/nishantvt11/gs_insurance.git
cd your-repo-name
```

### 2.Install dependencies:

```bash
poetry install
```

### 3.Trigger virtual environment:
```bash
poetry shell
```


All dependencies are declared in pyproject.toml.


## Project Structure

```
gs_insurance/
├── pyproject.toml      # Poetry config and dependencies
├── gs_insurance/       # The dbt project where models are defined           
```