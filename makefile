test-train:
	python3 crnn_main.py --trainroot ../image-auditor/watermark/_test/rcnn.pickle,../image-auditor/watermark/_test/rcnn.pickle \
		--valroot ../image-auditor/watermark/_test/rcnn.pickle \
		--experiment ./data/model \
		--displayInterval 1 --n_test_disp 2 --niter 2 --batchSize 1 --random_sample --saveInterval 2 \
		--crnn ./data/crnn.pth

train:
	trainroot=../image-auditor/watermark/data/data/rcnn-1/rcnn.pickle; \
	trainroot=$$trainroot,../image-auditor/watermark/data/data/rcnn-2/rcnn.pickle; \
	trainroot=$$trainroot,../image-auditor/watermark/data/data/rcnn-3/rcnn.pickle; \
	trainroot=$$trainroot,../image-auditor/watermark/data/data/rcnn-4/rcnn.pickle; \
	python3 crnn_main.py --trainroot $$trainroot \
		--valroot ../image-auditor/watermark/data/data/rcnn/rcnn.pickle \
		--experiment ./data/model/train \
		--random_sample --crnn ./data/crnn.pth --workers 1 --cuda --lr 0.001

train-1:
	trainroot=../image-auditor/watermark/data/data/rcnn-5/rcnn.pickle; \
	trainroot=$$trainroot,../image-auditor/watermark/data/data/rcnn-6/rcnn.pickle; \
	trainroot=$$trainroot,../image-auditor/watermark/data/data/rcnn-7/rcnn.pickle; \
	trainroot=$$trainroot,../image-auditor/watermark/data/data/rcnn-8/rcnn.pickle; \
	python3 crnn_main.py --trainroot $$trainroot \
		--valroot ../image-auditor/watermark/data/data/rcnn/rcnn.pickle \
		--experiment ./data/model/train-1 \
		--random_sample --crnn ./data/model/train/netCRNN_16_1000.pth --workers 1 --cuda --lr 0.0001 --niter 15

train-2:
	trainroot=../image-auditor/watermark/data/data/rcnn-9/rcnn.pickle; \
	trainroot=$$trainroot,../image-auditor/watermark/data/data/rcnn-10/rcnn.pickle; \
	trainroot=$$trainroot,../image-auditor/watermark/data/data/rcnn-11/rcnn.pickle; \
	trainroot=$$trainroot,../image-auditor/watermark/data/data/rcnn-12/rcnn.pickle; \
	python3 crnn_main.py --trainroot $$trainroot \
		--valroot ../image-auditor/watermark/data/data/rcnn/rcnn.pickle \
		--experiment ./data/model/train-2 \
		--random_sample --crnn ./data/model/train-1/netCRNN_14_6000.pth --workers 1 --cuda --lr 0.00005 --niter 15

MODEL_PATH=./data/model/train-2/netCRNN_14_6000.pth
DECODED_FILE=decoded.1.csv
test-rea:
	for f in `ls t/Texts`; do rec=`python3 demo.py ${MODEL_PATH} t/Texts/$$f | grep '=>' | egrep -o '=> .*' | cut -c4-`; echo $$f,$$rec | tee -a ${DECODED_FILE}; done
