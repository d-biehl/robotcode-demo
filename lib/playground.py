from typing import Any, Sequence
from robot.api.interfaces import DynamicLibrary, Name, NamedArgs


class playground(DynamicLibrary):
    def __init__(self, name: str | None = None) -> None:
        self.name = name

    def get_keyword_names(self) -> Sequence[str]:
        result = ["Run Keyword"]

        if self.name:
            result.append(self.name)

        return result

    def run_keyword(self, name: Name, args: Sequence[Any], named: NamedArgs) -> Any:
        print(f"Running keyword '{name}' with args {args} and named args {named}")
