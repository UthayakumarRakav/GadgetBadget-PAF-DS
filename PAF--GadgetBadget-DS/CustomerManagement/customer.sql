
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `GadgetBadget`
--

-- --------------------------------------------------------

--
-- Table structure for table `Customer`
--

CREATE TABLE `Customer` (
  `cID` int(10) NOT NULL,
  `cName` varchar(120) NOT NULL,
  `gender` varchar(120) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `email` varchar(200) NOT NULL,
  `city` varchar(10) NOT NULL,
  `region` varchar(15) NOT NULL,
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Customer`
--

INSERT INTO `Customer` (`cID`, `cName`, `gender`, `phone`, `email`, `city`, `region`) VALUES
(29, 'jathushan', 'Male', '0758562497', 'jaffna@gmail.com', 'jaffna', 'northern'),
(30, 'vathu', 'Female', '0765489652', 'colombo3@gmail.com', 'colombo', 'southern');


--
-- Indexes for dumped tables
--

--
-- Indexes for table `Customer`
--
ALTER TABLE `Customer`
  ADD PRIMARY KEY (`cID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Customer`
--
ALTER TABLE `Customer`
  MODIFY `cID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
