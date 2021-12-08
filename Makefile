# Change as needed
python_ver='python3.9'


# Keep this first so 'make' works
# Install Package
install:
	$(python_ver) setup.py install

# Check linting
check:
	$(python_ver) -m pylint messari/*py
	$(python_ver) -m pylint messari/messari/*py
	$(python_ver) -m pylint messari/defillama/*py

# Test Library
test:
	$(python_ver) unit_testing/messari_tests.py
	$(python_ver) unit_testing/defillama_tests.py

# Make documentation
docs:
	cd docs/ && make html

# Clean up after build
clean:
	rm -r build dist messari.egg-info

# Uninstall package
uninstall:
	$(python_ver) -m pip uninstall messari

# List options
list:
	@grep '^[^#[:space:]].*:' Makefile
