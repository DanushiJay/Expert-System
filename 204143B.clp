(deftemplate transaction_characteristics
   (slot transaction_amount)
   (slot purchase_location)
   (slot transaction_time)
   (slot transaction_device)
)

(defrule start
   =>
   (printout t crlf)
   (printout t "Welcome to the Credit Card Fraud Detection System!" crlf)
   (printout t "Please answer the following questions to find the probability of fraud occurrence." crlf)
   (assert (transaction_characteristics (transaction_amount nil) (purchase_location nil) (transaction_time nil)))
)

(defrule ask-transaction
   (transaction_characteristics (transaction_amount nil))
   =>
   (printout t crlf)
   (printout t "Please select the transaction amount range:" crlf)
   (printout t "1. High" crlf)
   (printout t "2. Medium" crlf)
   (printout t "3. Low" crlf)
   (printout t "Enter High, Medium, or Low: ")
   (bind ?transaction_amount (readline))
   (assert (transaction_characteristics (transaction_amount ?transaction_amount)))
)

(defrule ask-purchase-location
   (transaction_characteristics (transaction_amount ?transaction_amount) (purchase_location nil))
   =>
   (printout t crlf)
   (printout t "Select the type of purchase location:" crlf)
   (printout t "1. Familiar Location" crlf)
   (printout t "2. Unfamiliar Location" crlf)
   (printout t "Enter Familiar or Unfamiliar: ")
   (bind ?purchase_location (readline))
   (assert (transaction_characteristics (transaction_amount ?transaction_amount) (purchase_location ?purchase_location)))
)

(defrule ask-transaction-time
   (transaction_characteristics (transaction_amount ?transaction_amount) (purchase_location ?purchase_location) (transaction_time nil))
   =>
   (printout t crlf)
   (printout t "Select the type of transaction time:" crlf)
   (printout t "1. Regular Hours" crlf)
   (printout t "2. Unusual Hours" crlf)
   (printout t "Enter Regular or Unusual: ")
   (bind ?transaction_time (readline))
   (assert (transaction_characteristics (transaction_amount ?transaction_amount) (purchase_location ?purchase_location) (transaction_time ?transaction_time)))
)

(defrule ask-transaction-device
   (transaction_characteristics (transaction_amount ?transaction_amount) (purchase_location ?purchase_location)  (transaction_time ?transaction_time) (transaction_device nil))
   =>
   (printout t crlf)
   (printout t "Select the type of transaction device:" crlf)
   (printout t "1. Usual Device" crlf)
   (printout t "2. Unusual Device" crlf)
   (printout t "Enter Usual or Unusual: ")
   (bind ?transaction_device (readline))
   (assert (transaction_characteristics (transaction_amount ?transaction_amount) (purchase_location ?purchase_location) (transaction_time ?transaction_time) (transaction_device ?transaction_device)))
)

(defrule recommend-fraud-level
   (transaction_characteristics (transaction_amount ?transaction_amount) (purchase_location ?purchase_location) (transaction_time ?transaction_time) (transaction_device ?transaction_device))
   =>
   (printout t crlf)
   (printout t "Based on the entered information, the degree of fraud occurrence level is:" crlf)
   (if (and (eq ?transaction_amount "High") (eq ?purchase_location "Unfamiliar") (eq ?transaction_time "Unusual") (eq ?transaction_device "Unusual"))
   then
       (printout t "Fraud Probability - High" crlf)

   else if (and (eq ?transaction_amount "Medium") (eq ?purchase_location "Unfamiliar") (eq ?transaction_time "Unusual") (eq ?transaction_device "Unusual"))
       then
       (printout t "Fraud Probability - High" crlf)

   else if (and (eq ?transaction_amount "Low") (eq ?purchase_location "Unfamiliar") (eq ?transaction_time "Unusual") (eq ?transaction_device "Unusual"))
       then
       (printout t "Fraud Probability - High" crlf)

   else if (and (eq ?transaction_amount "High") (eq ?purchase_location "Unfamiliar") (eq ?transaction_time "Unusual") (eq ?transaction_device "Unusual"))
      then
       (printout t "Fraud Probability - Medium" crlf)

   else if (and (eq ?transaction_amount "High") (eq ?purchase_location "Unfamiliar") (eq ?transaction_time "Regular") (eq ?transaction_device "Unusual"))
       then
       (printout t "Fraud Probability - Medium" crlf)

   else if (and (eq ?transaction_amount "High") (eq ?purchase_location "Familiar") (eq ?transaction_time "Regular") (eq ?transaction_device "Unusual"))
      then
       (printout t "Fraud Probability - Medium" crlf)

   else if (and (eq ?transaction_amount "High") (eq ?purchase_location "Familiar") (eq ?transaction_time "Unusual") (eq ?transaction_device "Unusual"))
      then
       (printout t "Fraud Probability - Medium" crlf)

   else if (and (eq ?transaction_amount "Medium") (eq ?purchase_location "Familiar") (eq ?transaction_time "Unusual") (eq ?transaction_device "Unusual"))
     then
       (printout t "Fraud Probability - Medium" crlf)

   else if (and (eq ?transaction_amount "Medium") (eq ?purchase_location "Unfamiliar") (eq ?transaction_time "Regular") (eq ?transaction_device "Unusual"))
      then
       (printout t "Fraud Probability - Medium" crlf)

   else if (and (eq ?transaction_amount "Medium") (eq ?purchase_location "Unfamiliar") (eq ?transaction_time "Unusual") (eq ?transaction_device "Unusual"))
      then
       (printout t "Fraud Probability - Medium" crlf)

   else if (and (eq ?transaction_amount "Low") (eq ?purchase_location "Unfamiliar") (eq ?transaction_time "Unusual") (eq ?transaction_device "Unusual"))
      then
       (printout t "Fraud Probability - Medium" crlf)

   else if (and (eq ?transaction_amount "Low") (eq ?purchase_location "Familiar") (eq ?transaction_time "Unusual") (eq ?transaction_device "Unusual"))
      then
       (printout t "Fraud Probability - Medium" crlf)

   else if (and (eq ?transaction_amount "High") (eq ?purchase_location "Familiar") (eq ?transaction_time "Regular") (eq ?transaction_device "Usual"))
     then
       (printout t "Fraud Probability - Low" crlf)

   else if (and (eq ?transaction_amount "High") (eq ?purchase_location "Unfamiliar") (eq ?transaction_time "Regular") (eq ?transaction_device "Usual"))
     then
       (printout t "Fraud Probability - Low" crlf)

   else if (and (eq ?transaction_amount "High") (eq ?purchase_location "Familiar") (eq ?transaction_time "Unusual") (eq ?transaction_device "Usual"))
     then
       (printout t "Fraud Probability - Low" crlf)

   else if (and (eq ?transaction_amount "Medium") (eq ?purchase_location "Familiar") (eq ?transaction_time "Regular") (eq ?transaction_device "Unusual"))
       then
       (printout t "Fraud Probability - Low" crlf)

   else if (and (eq ?transaction_amount "Medium") (eq ?purchase_location "Familiar") (eq ?transaction_time "Regular") (eq ?transaction_device "Usual"))
      then
       (printout t "Fraud Probability - Low" crlf)

   else if (and (eq ?transaction_amount "Medium") (eq ?purchase_location "Familiar") (eq ?transaction_time "Unusual") (eq ?transaction_device "Unusual"))
       (printout t "Fraud Probability - Low" crlf)

   else if (and (eq ?transaction_amount "Medium") (eq ?purchase_location "Unfamiliar") (eq ?transaction_time "Regular") (eq ?transaction_device "Usual"))
      then
       (printout t "Fraud Probability - Low" crlf)

   else if (and (eq ?transaction_amount "Low") (eq ?purchase_location "Familiar") (eq ?transaction_time "Regular") (eq ?transaction_device "Usual"))
      then
       (printout t "Fraud Probability - Low" crlf)

   else if (and (eq ?transaction_amount "Low") (eq ?purchase_location "Familiar") (eq ?transaction_time "Regular") (eq ?transaction_device "Unusual"))
       then
       (printout t "Fraud Probability - Low" crlf)

   else if (and (eq ?transaction_amount "Low") (eq ?purchase_location "Familiar") (eq ?transaction_time "Unusual") (eq ?transaction_device "Usual"))
      then
       (printout t "Fraud Probability - Low" crlf)

   else if (and (eq ?transaction_amount "Low") (eq ?purchase_location "Unfamiliar") (eq ?transaction_time "Regular") (eq ?transaction_device "Usual"))
      then
       (printout t "Fraud Probability - Low" crlf)

   else if (and (eq ?transaction_amount "Low") (eq ?purchase_location "Unfamiliar") (eq ?transaction_time "Regular") (eq ?transaction_device "Unusual"))
     then
       (printout t "Fraud Probability - Low" crlf)

   else
       (printout t "Please enter details correctly." crlf)
   )
   (halt)
)
