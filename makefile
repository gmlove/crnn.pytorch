test-train:
	python3 crnn_main.py --trainroot ../image-auditor/watermark/_test/rcnn.pickle \
		--valroot ../image-auditor/watermark/_test/rcnn.pickle \
		--experiment ./data/model \
		--displayInterval 1 --n_test_disp 2 --niter 2 --batchSize 1 --random_sample --saveInterval 2 \
		--crnn ./data/crnn.pth

trai:
	python3 crnn_main.py --trainroot ../image-auditor/watermark/data/data/rcnn-1/rcnn.pickle \
		--valroot ../image-auditor/watermark/data/data/rcnn/rcnn.pickle \
		--experiment ./data/model/train \
		--random_sample --crnn ./data/crnn.pth --cuda --lr 0.001