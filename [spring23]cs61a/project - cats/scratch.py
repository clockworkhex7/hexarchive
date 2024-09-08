def credit_card(card_number):
    last = card_number % 10
    if card_number < 10:
        return card_number
    return last + double_credit_card(card_number // 10)

def double_credit_card(card_number):
    digit = (card_number % 10) * 2
    if digit > 9:
        digit = digit // 10 + digit % 10
    if card_number < 10:
        return digit
    return digit + credit_card(card_number // 10)

print(credit_card(5236497963573103))