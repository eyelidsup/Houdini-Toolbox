
# Quickly compile Qt icons using PySide2.
build-icons:
	pyside2-rcc -o python/ht/ui/icons.py icons/icons.qrc

# Invoke hcmake and make to build all plugins.
build-plugins:
	mkdir -p ${CURDIR}/plugins/build
	cd ${CURDIR}/plugins/build && hcmake .. && make

# Build a single plugin: build-plugin PLUGIN={PLUGIN_NAME}
build-plugin:
	mkdir -p ${CURDIR}/plugins/build
	cd ${CURDIR}/plugins/build && hcmake .. && make ${PLUGIN}

# Clean built plugins.
clean-plugins:
	cd ${CURDIR}/plugins/build && make clean
	rm -rf ${CURDIR}/plugins/build

# List all available plugins
list-targets:
	cd ${CURDIR}/plugins/build && make help

# Initialize the build location and run cmake
init-build:
	mkdir -p ${CURDIR}/plugins/build
	cd ${CURDIR}/plugins/build && hcmake ..

.PHONY: run-flake run-lint run-lint-py3k

# Run all linting targets
run-all-linting: run-flake run-lint run-lint-py3k

# Run flake8 linting
run-flake:
	flake8

# Run python linting
run-lint:
	bin/run_lint

# Run python linting against Python 3 compatibility
run-lint-py3k:
	bin/run_lint --py3k

# Run Python unit tests
run-tests:
	hython bin/run_tests.py
