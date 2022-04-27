unit reportBonus;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls , DialogFormUnit ,ChildFormUnit,
  InvokeRegistry, Rio, SOAPHTTPClient, DBTables, DB, dbf;

type
  TfrmReportBonus = class(TDialogForm)
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    lblMonthGen: TLabel;
    edtMonthGen: TComboBox;
    lblYearGen: TLabel;
    edtYearGen: TComboBox;
    lblEPRenName: TLabel;
    edtDepartment: TEdit;
    spbEPRen: TSpeedButton;
    RadioGroup1: TRadioGroup;
    rbFinworkerKindTech: TRadioButton;
    rbFinworkerKindZbut: TRadioButton;
    HTTPRIOENBonusListItem: THTTPRIO;
    Dbf1: TDbf;
    rbFinworkerKindZbutController: TRadioButton;
    rbFinworkerKindZbutInspektor: TRadioButton;
    procedure btnOkClick(Sender: TObject);
    procedure spbEPRenClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure rbFinworkerKindZbutClick(Sender: TObject);
    procedure rbFinworkerKindTechClick(Sender: TObject);
    procedure makeDBFExport2();
    procedure rbFinworkerKindZbutControllerClick(Sender: TObject);
    procedure rbFinworkerKindZbutInspektorClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReportBonus: TfrmReportBonus;
  departmentcode : integer;
  forExportDBF : integer;

implementation

uses EnergyproController, DMReportsUnit, ShowENDepartment,
  ENDepartmentController, ENBonusListItemController, ENConsts,
  ENCoefficientExecPlanController;

{$R *.dfm}

procedure TfrmReportBonus.btnOkClick(Sender: TObject);
var
 argNames, args: ArrayOfString;
 reportName: String; //strTabNumbers : String; //Исключено объявление не используемых переменных
begin

  if forExportDBF = 0 then
  begin

       SetLength(argNames, 5);
       SetLength(args, 5);

       argNames[0] := 'year';
       args[0]:= edtYearGen.Text;

       argNames[1] := 'month';
       args[1]:= IntToStr(edtMonthGen.ItemIndex+1);

       argNames[2] := 'department';
       args[2]:= IntToStr(departmentcode);

       argNames[3] := 'enbonuslistkind';

       if (rbFinworkerKindTech.Checked = true) then
         args[3]:= IntToStr(ENConsts.FINWORKER_KIND_PROM)
       else if (rbFinworkerKindZbut.Checked = true) then
         args[3]:= IntToStr(ENConsts.FINWORKER_KIND_ESBYT)
       else if (rbFinworkerKindZbutController.Checked = true) then
         args[3]:= IntToStr(ENConsts.FINWORKER_KIND_ESBYT_CONTROLLER)
       else if (rbFinworkerKindZbutInspektor.Checked = true) then
         args[3]:= IntToStr(ENConsts.FINWORKER_KIND_ESBYT_INSPEKTOR);


       if ((rbFinworkerKindTech.Checked) and (departmentcode = 0 )) then
       begin
         Application.MessageBox(PChar(' Необхідно обрати підрозділ !!!'), PChar('Увага!'),MB_ICONWARNING);
         ModalResult:= mrNone;
         exit;
       end;

       if rbFinworkerKindTech.Checked then
          reportName := 'PercentPremiums/Tech/SavedPremiumsMain'
       else
          reportName := 'PercentPremiums/Zbyt/SavedPremiumsMain';
//       if (rbxls.Checked) then
//       makeReport(reportName, argNames, args, 'xls');
//       if (rbpdf.Checked) then
       makeReport(reportName, argNames, args, 'pdf');
  end;
  if forExportDBF = 1 then
  begin
     makeDBFExport2();
  end;

end;

procedure TfrmReportBonus.FormShow(Sender: TObject);
begin
   departmentcode := 0;
   DisableControls([edtDepartment]);
   SetComboBoxCurrentMonth(edtMonthGen);
   SetComboBoxCurrentYearWithStart(edtYearGen,2009,2);
end;

procedure TfrmReportBonus.rbFinworkerKindTechClick(Sender: TObject);
begin
    if ( (rbFinworkerKindTech.Checked)  and (forExportDBF=0  ))then
     begin
      HideControls( [lblEPRenName,edtDepartment,spbEPRen] , false );
     end;
end;

procedure TfrmReportBonus.rbFinworkerKindZbutClick(Sender: TObject);
begin
    if rbFinworkerKindZbut.Checked  then
     begin
      HideControls( [lblEPRenName,edtDepartment,spbEPRen] , true );
      edtDepartment.Text := '';
      departmentcode:= 0;
     end;
end;

procedure TfrmReportBonus.rbFinworkerKindZbutControllerClick(Sender: TObject);
begin
    if ( (rbFinworkerKindZbutController.Checked)  and (forExportDBF=0  ))then
     begin
      HideControls( [lblEPRenName,edtDepartment,spbEPRen] , false );
     end;
end;

procedure TfrmReportBonus.rbFinworkerKindZbutInspektorClick(Sender: TObject);
begin

   if rbFinworkerKindZbutInspektor.Checked  then
     begin
      HideControls( [lblEPRenName,edtDepartment,spbEPRen] , true );
      edtDepartment.Text := '';
      departmentcode:= 0;
     end;
end;

procedure TfrmReportBonus.spbEPRenClick(Sender: TObject);
var
   frmENDepartmentShow: TfrmENDepartmentShow;
   f : ENDepartmentFilter;
begin
   f := ENDepartmentFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);
   f.code := 1;

   frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application,fmNormal, f);
   try
      frmENDepartmentShow.isShowAll := true;
      with frmENDepartmentShow do begin
        if ShowModal = mrOk then
        begin
            try
               departmentcode := ENDepartmentShort(tvDep.Selected.Data).code;
               edtDepartment.Text:= ENDepartmentShort(tvDep.Selected.Data).shortName;
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;

end;



procedure TfrmReportBonus.makeDBFExport2();
var
 TempENBonusListItem: ENBonusListItemControllerSoapPort;
 FilterBonusListItem:   ENBonusListItemFilter;
 ENBonusListItemList: ENBonusListItemShortList;
 AppPath, ExportPath  , fileName: String;
 //Param: Tstrings;
 i: Integer;
 kindBonusList : integer;
begin
 TempENBonusListItem := HTTPRIOENBonusListItem as ENBonusListItemControllerSoapPort;

  FilterBonusListItem := ENBonusListItemFilter.Create;
  SetNullIntProps(FilterBonusListItem);
  SetNullXSProps(FilterBonusListItem);

  if rbFinworkerKindTech.Checked then
   kindBonusList := ENConsts.FINWORKER_KIND_PROM;  // технич
  if rbFinworkerKindZbut.Checked then
   kindBonusList := ENConsts.FINWORKER_KIND_ESBYT;  // сбыт монтеры
  if rbFinworkerKindZbutController.Checked then
   kindBonusList := ENConsts.FINWORKER_KIND_ESBYT_CONTROLLER;  // сбыт контролеры
  if rbFinworkerKindZbutInspektor.Checked then
   kindBonusList := ENConsts.FINWORKER_KIND_ESBYT_INSPEKTOR;  // сбыт инспектора

  FilterBonusListItem.orderBySQL := ' tabnumber , datestart ';

  FilterBonusListItem.conditionSQL := ' enbonuslistitem.bonuslistcode in ( ' +
                    ' Select b.code from enbonuslist b ' +
  ' Where b.monthgen = ' + IntToStr(edtMonthGen.ItemIndex+1) +
  '  and b.yeargen = ' + edtYearGen.Text +
  '  and b.kindrefcode = ' + IntToStr(kindBonusList) +
  '  and b.statuscode = ' + IntToStr(enconsts.ENBONUSLIST_STATUS_APPROVED) +
  ' )  and enbonuslistitem.statuscode = ' + IntToStr(enconsts.ENBONUSLISTITEM_STATUS_VALID);

  ENBonusListItemList := TempENBonusListItem.getScrollableFilteredList(FilterBonusListItem,0,-1);

  if ENBonusListItemList.totalCount > 0  then
  begin
        // формирование имени файла
        if rbFinworkerKindTech.Checked then
         fileName := 'прем_техн_' +  IntToStr(edtMonthGen.ItemIndex+1) + edtYearGen.Text + '.dbf';
        if rbFinworkerKindZbut.Checked then
         fileName := 'прем_сбыт_електромонтеры' +  IntToStr(edtMonthGen.ItemIndex+1) + edtYearGen.Text + '.dbf';
        if rbFinworkerKindZbutController.Checked then
         fileName := 'прем_сбыт_контролеры' +  IntToStr(edtMonthGen.ItemIndex+1) + edtYearGen.Text + '.dbf';
        if rbFinworkerKindZbutInspektor.Checked then
         fileName := 'прем_сбыт_инспекторы' +  IntToStr(edtMonthGen.ItemIndex+1) + edtYearGen.Text + '.dbf';

        // Формирование пути сохранения и создание директорий
        AppPath := ExtractFilePath(Application.ExeName);
        ExportPath := AppPath + BonusExportPath + 'ВедомостиПремия\';
        if not DirectoryExists(AppPath + BonusExportPath) then
          CreateDir(AppPath + BonusExportPath);
        if not DirectoryExists(ExportPath) then
          CreateDir(ExportPath);

       // создадим таблицу
//       Param := TStringList.Create;
//       try
//         with Param do begin
//           param.Add('LANGDRIVER=DBWINUS0');
//           param.Add('LEVEL=4');
//         end;
//          ssnExpBonus.ModifyDriver('DBASE',param);
//       finally
//         Param.free;
//       end;

       if FileExists(ExportPath +FileName) then
       begin
         DeleteFile(ExportPath +FileName);
       end;

       DBF1.FilePath := ExtractFilePath(ExportPath +FileName);
       DBF1.TableName := ExtractFileName(ExportPath +FileName);
       with DBF1.FieldDefs do
         begin
          Add('tabn', ftString, 6, false);  // табельный номер
          Add('podr', ftString, 20, false); // код подразделения
          Add('posada', ftString ,300 ,false);       // должность
          Add('periodS',ftDate ,0 ,false);        //период С
          Add('periodPO',ftDate ,0 ,false);         // период ПО
          Add('procent'  , ftFloat , 0 , false );   // процент премии
          Add('kategor', ftString ,100 ,false);       // разряд
        end;



          try
           DBF1.CreateTable;
          except
          on E : Exception do
           begin
             ShowMessage('Exception message = '+E.Message);
             DBF1.Close;
             exit;
           end;

          end;

      DBF1.Open;
     try
      for i:=0 to  ENBonusListItemList.totalCount -1 do
      begin
        DBF1.Insert;

        DBF1.FieldByName('tabn').AsString := ENBonusListItemList.list[i].tabNumber;
        DBF1.fieldbyName('podr').AsString := ENBonusListItemList.list[i].podrId;
        DBF1.FieldByName('posada').AsString := ENBonusListItemList.list[i].positionId;
        DBF1.FieldByName('periodS').AsDateTime := ENBonusListItemList.list[i].dateStart.AsDate;
        DBF1.FieldByName('periodPO').AsDateTime := ENBonusListItemList.list[i].dateFinal.AsDate;
        DBF1.FieldByName('procent').AsFloat := StrToFloat(ENBonusListItemList.list[i].percentBonusForCharging.DecimalString);
        DBF1.FieldByName('kategor').AsString := ENBonusListItemList.list[i].tradeCategoryId;
        DBF1.Post;


      end;

      DBF1.Close;
     except
      on E : Exception do
           begin
             ShowMessage('Exception on insert data in dbf file  = '+E.Message);
             DBF1.Close;
             exit;
           end;
     end;

      Application.MessageBox(PChar('Експорт завершений!' + #13#10 +
                                   'Відомість збережена за шляхом "' + ExportPath + '" !'),
                         PChar('Сообщение'), MB_ICONINFORMATION);

  end
  else
  begin
    Application.MessageBox(PChar('DBF файл не сформований !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
    Exit;
  end;



end;

end.
