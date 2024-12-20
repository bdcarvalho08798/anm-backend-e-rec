import React from "react";
import { styled } from "@mui/material/styles";
import InputBase from "@mui/material/InputBase";
import SearchIcon from "@mui/icons-material/Search";
import { SxProps } from "@mui/system"; // Import the type for sx

const Search = styled("div")(({ theme }) => ({
  position: "relative",

  marginRight: theme.spacing(2),
  marginLeft: 0,
  width: "100%",
  backgroundColor: '#e6e6ff',
  borderRadius: '10px',
  [theme.breakpoints.up("sm")]: {
    marginLeft: theme.spacing(3),
    width: "auto",
  },
}));

const SearchIconWrapper = styled("div")(({ theme }) => ({
  padding: theme.spacing(0, 2),
  height: "100%",
  position: "absolute",
  pointerEvents: "none",
  display: "flex",
  alignItems: "center",
  justifyContent: "center",
}));

const StyledInputBase = styled(InputBase)(({ theme }) => ({
  color: "inherit",
  "& .MuiInputBase-input": {
    padding: theme.spacing(1, 1, 1, 0),
    paddingLeft: `calc(1em + ${theme.spacing(4)})`,
    transition: theme.transitions.create("width"),
    width: "100%",
  },
}));

interface SearchBarProps {
  setSearchQuery: React.Dispatch<React.SetStateAction<string>>;
  sx?: SxProps;  // Accept sx prop for styles
}

export default function SearchBar({ setSearchQuery, sx }: SearchBarProps) {
  return (
    <div className="h-full w-full flex items-center justify-center">
      <div className="w-full max-w-3xl">
        <Search sx={sx}> {/* Pass the sx prop here */}
          <SearchIconWrapper>
            <SearchIcon />
          </SearchIconWrapper>
          <StyledInputBase
            placeholder="Search…"
            inputProps={{ "aria-label": "search" }}
            onChange={(e) => setSearchQuery(e.target.value)}
          />
        </Search>
      </div>
    </div>
  );
}
