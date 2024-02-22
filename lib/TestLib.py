class TestLib:
    def __init__(self, start_value: int | None = 0):
        self._value = 0

    def increment(self) -> None:
        self._value += 1

    def get_value(self) -> int:
        return self._value
