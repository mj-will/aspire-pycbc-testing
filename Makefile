.PHONY: simple-test
simple-test : 
	rm -rf simple_test/outdir
	mkdir -p simple_test/outdir
	cd simple_test; pycbc_inference --config-files simp.ini aspire_stub.ini \
	--output-file outdir/aspire.hdf --seed 10 --nprocesses 1 --verbose --force


post_processing_example/outdir/nessai.hdf : 
	mkdir -p post_processing_example/outdir
	cd post_processing_example; pycbc_inference --config-files simp.ini nessai_stub.ini \
	--output-file outdir/nessai.hdf --seed 10 --nprocesses 1 --verbose --force

.PHONY: post-processing-example
post-processing-example : post_processing_example/outdir/nessai.hdf
	rm -rf post_processing_example/outdir/aspire.hdf
	mkdir -p post_processing_example/outdir
	cd post_processing_example; pycbc_inference --config-files simp.ini aspire_stub.ini \
	--output-file outdir/aspire.hdf --seed 10 --nprocesses 1 --verbose --force

.PHONY: multiprocessing-test
multiprocessing-test : 
	rm -rf multiprocessing_test/outdir
	mkdir -p multiprocessing_test/outdir
	cd multiprocessing_test; pycbc_inference --config-files mp_test.ini \
	--output-file outdir/aspire.hdf --seed 10 --nprocesses 2 --verbose --force