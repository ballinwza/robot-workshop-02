*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://www.allonline.7eleven.co.th

${USERNAME}    JohnWick
${PASSWORD}    IWillKillYouIfYouWantToKnowMyPassword

${SEARCH_KEYWORD}    ยำยำช้างน้อย รสบาร์บีคิว 120 กรัม
${EXPECT_PRODUCT_SEARCH}    ยำยำช้างน้อย รสบาร์บีคิว 120 กรัม (20 กรัม X 6 ซอง) - ยำยำ, 7Online

${FIRST_NAME}    พันกร
${LAST_NAME}    ชมจันทร์
${PHONE_NUMBER}    0619917765
${ADDRESS_NUMBER}    45/9
${ADDRESS_MOO}    7
${ADDRESS_PROVINCE}    สมุทรปราการ
${ADDRESS_DISTRICT}    บางพลี
${ADDRESS_SUB_DISTRICT}    บางปลา

${EXPECT_PAYMENT_CLIENT_DETAIL}    พันกร ชมจันทร์
${EXPECT_PAYMENT_PHONE}    0619917765
${EXPECT_PAYMENT_PRODUCT_DETAIL}    ยำยำช้างน้อย รสบาร์บีคิว 120 กรัม (20 กรัม X 6 ซอง)
${EXPECT_PAYMENT_QUANTITY_DETAIL}    5
${EXPECT_PAYMENT_PRICE_DETAIL}    ฿ 185
${EXPECT_PAYMENT_SHIPPING_PRICE_DETAIL}    ฿ 35
${EXPECT_PAYMENT_POINT_DETAIL}    54
${EXPECT_PAYMENT_TOTAL_PRICE_DETAIL}    ฿ 220

${EXPECT_PAYMENT_CARD_NAME}    พันกร ชมจันทร์
${EXPECT_PAYMENT_CARD_NUMBER}    46246977491778712
${EXPECT_PAYMENT_EXPIRE_DATE}    01/29
${EXPECT_PAYMENT_CV_CODE}    476