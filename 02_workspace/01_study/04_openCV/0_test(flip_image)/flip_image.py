import cv2

img = cv2.imread('w_logo_600_450.jpg')
if img is None:
    print('image is none.')
    exit(1)

flipImg = cv2.flip(img, 0)
cv2.imwrite('w_logo_600_450_flip.jpg', flipImg)