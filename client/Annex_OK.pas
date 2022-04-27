unit Annex_OK;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons , DialogFormUnit, DMReportsUnit, ExtCtrls,
  InvokeRegistry, Rio, SOAPHTTPClient, ADODB, DB, DBTables;

type
  TfrmAnnex_OK = class(TDialogForm)
    lbl1: TLabel;
    lbl2: TLabel;
    cbbStartMonth: TComboBox;
    lbl3: TLabel;
    cbbEndMonth: TComboBox;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    cbbYearGen: TComboBox;
    rg1: TRadioGroup;
    rbExpXLS: TRadioButton;
    rbExpDBF: TRadioButton;
    HTTPRIOReport: THTTPRIO;
    conADOConn: TADOConnection;
    qryDBF: TADOQuery;
    ADOCommand: TADOCommand;
    tblForReestr: TTable;
    ssn1: TSession;
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAnnex_OK: TfrmAnnex_OK;

implementation

{$R *.dfm}

uses EnergyproController, ENReportsController, ENConsts;

procedure TfrmAnnex_OK.btnOkClick(Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName: String;
  var ys,ms,ds,yf,mf,df: Word;
  dataList, res: AnswerFileDodatokOkList;
  tmpList: ArrayOfAnswerFileDodatokOk;
    /////
  TempReport: ENReportControllerSoapPort;
  fileName  , fileNameMonth , AppPath , ExportPath : String;
  i : Integer;
   param:TStrings;
begin

    SetLength(argNames, 3);
    SetLength(args, 3);

    argNames[0] := 'year';
    args[0] :=  cbbYearGen.Text;

    argNames[1] := 'monthStart';
    args[1] :=  IntToStr(cbbStartMonth.ItemIndex + 1);

    argNames[2] := 'monthFinal';
    args[2] :=  IntToStr(cbbEndMonth.ItemIndex + 1);

    reportName:= 'Annex_OK/Annex_OK';
    if rbExpXLS.Checked then
    makeReport(reportName, argNames, args, 'xls');
   { if rbExpDBF.Checked then
    begin
      TempReport := HTTPRIOReport as ENReportControllerSoapPort;

            dataList := AnswerFileDodatokOkList.Create;
            dataList.Year := cbbYearGen.Text;
            dataList.MonthStart := IntToStr(cbbStartMonth.ItemIndex + 1);
            dataList.MonthFinal := IntToStr(cbbEndMonth.ItemIndex + 1);

            res := TempReport.getFileDodatokOk(dataList);


            AppPath := ExtractFilePath(Application.ExeName);
            ExportPath := AppPath + AnnexOkExportPath ;
            if not DirectoryExists(AppPath + AnnexOkExportPath) then
              CreateDir(AppPath + AnnexOkExportPath);
            if not DirectoryExists(ExportPath) then
              CreateDir(ExportPath);

            if length(IntToStr(cbbEndMonth.ItemIndex + 1)) = 1  then
            fileNameMonth := '0' + IntToStr(cbbEndMonth.ItemIndex + 1)
            else
            fileNameMonth :=  IntToStr(cbbEndMonth.ItemIndex + 1);

            fileName:= '20'+  cbbYearGen.Text + fileNameMonth + '0000';

            conADOConn.Close;
           // conADOConn.ConnectionString := 'Provider=MSDASQL;Driver=Microsoft dBase Driver (*.dbf);DefaultDir=' + ExportPath + ';' +'FIL=dBase IV'+'LANGDRIVER=DBWINUS0';
            // conADOConn.ConnectionString := 'Provider=MSDASQL;Driver=Microsoft dBase Driver (*.dbf);DefaultDir=' + ExportPath;



            if FileExists(ExportPath+'#'+fileName+'.dbf') then
             begin
                DeleteFile(ExportPath+'#'+fileName+'.dbf');

              //  ADOCommand.CommandText := 'DROP TABLE ' + '#'+fileName+'.dbf';
              //  ADOCommand.Execute;
             end;

            // conADOConn.Open;

             

           // conADOConn.ConnectionString := 'Provider=MSDASQL;Driver=Microsoft dBase Driver (*.dbf);DefaultDir=' + ExportPath;
           // conADOConn.Open;
            ADOCommand.CommandText := 'CREATE TABLE ' + 'temp'+fileName+'(Name_pr TEXT(200), Inn TEXT(30), Sm FLOAT, Type_pr TEXT(1), Type_sm TEXT(1))';
            ADOCommand.Execute;


             if res <> nil then
              for i:=0 to High(res.list) do
              begin
                if res.list[i] = nil then Continue;

               ADOCommand.CommandText := 'insert into ' + 'temp'+fileName + '(Name_pr,Inn,Sm,Type_pr,Type_sm) values (' +
                     chr(39) + res.list[i].Name_pr + chr(39) + ' , ' +
                     chr(39) + res.list[i].Inn + chr(39) + ' , '+
                     res.list[i].Sm.DecimalString + ' , ' +
                     chr(39) + res.list[i].Type_pr + chr(39) + ' , ' +
                     chr(39) + res.list[i].Type_sm + chr(39) + ')';
                     conADOConn.Open;

                try
                  ADOCommand.Execute;
                except
//                  msg := 'Ошибка при выполнении!' + #10#13 +
//                         'Запрос: ' + ADOCommand.CommandText + #10#13#10#13 +
//                         'Для продолжения нажмите <OK>, для отмены импорта - <Отмена>';

                  if MessageBox(GetForegroundWindow,
                                PChar('Ошибка'),
                                PChar('Сообщение'),
                                MB_ICONQUESTION + MB_OKCANCEL) <> IDOK then
                end;



                end;


                 RenameFile(ExportPath+'temp'+fileName+'.dbf' , ExportPath+'#'+fileName+'.dbf');

              end;    }

      if rbExpDBF.Checked then
      begin
            TempReport := HTTPRIOReport as ENReportControllerSoapPort;

            dataList := AnswerFileDodatokOkList.Create;
            dataList.Year := cbbYearGen.Text;
            dataList.MonthStart := IntToStr(cbbStartMonth.ItemIndex + 1);
            dataList.MonthFinal := IntToStr(cbbEndMonth.ItemIndex + 1);

            res := TempReport.getFileDodatokOk(dataList);


            AppPath := ExtractFilePath(Application.ExeName);
            ExportPath := AppPath + AnnexOkExportPath + 'ДодатокОК\';
            if not DirectoryExists(AppPath + AnnexOkExportPath) then
              CreateDir(AppPath + AnnexOkExportPath);
            if not DirectoryExists(ExportPath) then
              CreateDir(ExportPath);



            if length(IntToStr(cbbEndMonth.ItemIndex + 1)) = 1  then
            fileNameMonth := '0' + IntToStr(cbbEndMonth.ItemIndex + 1)
            else
            fileNameMonth :=  IntToStr(cbbEndMonth.ItemIndex + 1);

            fileName:= '20'+  cbbYearGen.Text + fileNameMonth + '0000';

             if FileExists(ExportPath+'#'+fileName+'.dbf') then
             begin
                DeleteFile(ExportPath+'#'+fileName+'.dbf');

              //  ADOCommand.CommandText := 'DROP TABLE ' + '#'+fileName+'.dbf';
              //  ADOCommand.Execute;
             end;

             if res <> nil then
             begin
                // создадим таблицу

                  Param := TStringList.Create;
                 try
                   with Param do begin
                     param.Add('LANGDRIVER=DBWINUS0');
                     param.Add('LEVEL=4');
                   end;
                   ssn1.ModifyDriver('DBASE',param);
                 finally
                   Param.free;
                 end;


              try
                with tblForReestr do
                  begin
                    DatabaseName := ExportPath;//+FileDestination'; (* alias *)
                    TableName := '#'+fileName+'.dbf';
                    TableType := ttDBase;
                    with FieldDefs do
                    begin
                       Clear;
                       Add('NAME_PR', ftString,255,false);
                       Add('INN', ftString,12,false);

                       with AddFieldDef do begin
                         Name := 'SM';
                         DataType :=  ftBCD;
                         Precision := 12;
                         Size := 2;
                         Required := False;
                       end;
                       Add('TYPE_PR', ftString,1,false);
                       Add('TYPE_SM', ftString,1,false);

                    end;
                    tblForReestr.CreateTable;
                  end;
                except
                  Application.MessageBox(PChar('Ошибка при создании файла'),PChar('Внимание !'),MB_ICONERROR+MB_OK);
                  Exit;
                end;


                  try
                   tblForReestr.Open;
                 except
                   Application.MessageBox(PChar('Ошибка при открытии файл ШАБЛОНА '+'#'+fileName+'.dbf'),PChar('Внимание !'),MB_ICONERROR+MB_OK);
                   Exit;
                 end;
                  tblForReestr.Edit;



                  for i:=0 to High(res.list) do
                    begin
                       if res.list[i] = nil then Continue;
                       tblForReestr.Insert;
                       tblForReestr.Fieldbyname('Name_pr').AsString  := res.list[i].Name_pr;
                       tblForReestr.Fieldbyname('Inn').AsString  := res.list[i].inn;
                       tblForReestr.Fieldbyname('Sm').AsFloat   := StrToFloat(res.list[i].sm.DecimalString);
                       tblForReestr.Fieldbyname('Type_pr').AsString  := res.list[i].type_pr;
                       tblForReestr.Fieldbyname('Type_sm').AsString  := res.list[i].type_sm;
                       tblForReestr.Post;
                    end;

                   // DBFExport.Close;
                    tblForReestr.Close;
                  //  RenameFile(ExportPath+'temp'+fileName+'.dbf' , ExportPath+'#'+fileName+'.dbf');
                  Application.MessageBox(PChar('Экспорт успешно завершен!' + #13#10 +
                               'данные сохранены в файл "' + ExportPath + '#'+fileName+'.dbf' + '" !'),
                         PChar('Сообщение'), MB_ICONINFORMATION);

    

      end;

    end;

 end;
end.
