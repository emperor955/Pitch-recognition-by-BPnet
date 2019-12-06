clear all;
practice_labelx = xlsread('practice_label.xlsx','Sheet2');
[xr,xc] = size(practice_labelx);
practice_label = zeros(36,xc);
for i = 1: xc
    for num = 1:xr
        if practice_labelx(num,i) == 1
            switch num
                case {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18}
                    practice_label(num,i) = 1;
                case 20
                    practice_label(19,i) = 1;
                case 22
                    practice_label(20,i) = 1;
                case 24
                    practice_label(21,i) = 1;
                case 26
                    practice_label(22,i) = 1;
                case 28
                    practice_label(23,i) = 1;
                case 30
                    practice_label(24,i) = 1;
                case 32
                    practice_label(25,i) = 1;
                case 35
                    practice_label(26,i) = 1;
                case 38
                    practice_label(27,i) = 1;
                case 41
                    practice_label(28,i) = 1;
                case 44
                    practice_label(29,i) = 1;
                case 47
                    practice_label(30,i) = 1;
                case 50
                    practice_label(31,i) = 1;
                case 54
                    practice_label(32,i) = 1;
                case 58
                    practice_label(33,i) = 1;
                case 62
                    practice_label(34,i) = 1;
                case 66
                    practice_label(35,i) = 1;
                case 70
                    practice_label(36,i) = 1;
            end
        end
    end
end
xlswrite('practice_label.xlsx',practice_label,3);
    
                    