import { FC, ReactNode } from 'react';
import { ThemeProvider } from 'styled-components';

// import { colors } from './themes';

// import { ThemeProps } from './types';

interface ThemeProviderProps {
  children: ReactNode;
}

const defaultTheme = {
  color: '',
};

const Theme: FC<ThemeProviderProps> = ({ children }) => (
  <ThemeProvider theme={defaultTheme}>{children}</ThemeProvider>
);

export default Theme;
//export type { ThemeProps };
