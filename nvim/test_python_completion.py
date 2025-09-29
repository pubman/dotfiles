"""Test file to verify Python completion details work with Jedi."""

def example_function(param1: str, param2: int = 10) -> str:
    """
    Example function with detailed docstring.

    Args:
        param1: A string parameter
        param2: An integer parameter with default value

    Returns:
        A formatted string
    """
    return f"{param1}: {param2}"

class TestClass:
    """Example class for testing completions."""

    def method_with_docs(self, value: str) -> bool:
        """
        Method with documentation.

        Args:
            value: String value to process

        Returns:
            Boolean result
        """
        return len(value) > 0

# Test completions by typing:
# example_function(
# TestClass().method_with_docs(