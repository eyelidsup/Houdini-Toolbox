"""Tests for ht.events.group module."""

# =============================================================================
# IMPORTS
# =============================================================================

# Standard Library Imports
import imp


# Houdini Toolbox Imports
import ht.events.group

# Reload the module to test to capture load evaluation since it has already
# been loaded.
imp.reload(ht.events.group)


# =============================================================================
# CLASSES
# =============================================================================

class Test_HoudiniEventGroup(object):
    """Test ht.events.group.HoudiniEventGroup class."""

    def test___init__(self):
        """Test object initialization."""
        group = ht.events.group.HoudiniEventGroup()

        assert group._data == {}
        assert group._event_map == {}

    # Properties

    def test_data(self, mocker):
        """Test the 'data' property."""
        mocker.patch.object(ht.events.group.HoudiniEventGroup, "__init__", lambda x: None)
        group = ht.events.group.HoudiniEventGroup()

        mock_value = mocker.MagicMock(spec=dict)
        group._data = mock_value
        assert group.data == mock_value

    def test_event_map(self, mocker):
        """Test 'event_map' property."""
        mocker.patch.object(ht.events.group.HoudiniEventGroup, "__init__", lambda x: None)
        group = ht.events.group.HoudiniEventGroup()

        mock_value = mocker.MagicMock(spec=dict)
        group._event_map = mock_value
        assert group.event_map == mock_value
