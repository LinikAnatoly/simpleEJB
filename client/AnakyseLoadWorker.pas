unit AnakyseLoadWorker;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, Buttons, StdCtrls, ComCtrls , ENPlanWorkController, ENHumenItemController,
  XSBuiltIns, InvokeRegistry, Rio, SOAPHTTPClient;

type
  TFrmAnakyseLoadWorker = class(TDialogForm)
    Label1: TLabel;
    edtDateStart: TDateTimePicker;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    Label2: TLabel;
    edtDateFinal: TDateTimePicker;
    lblENWorkerWorkerFactName: TLabel;
    edtENWorkerWorkerFactName: TEdit;
    spbENWorkerWorkerFact: TSpeedButton;
    spbFINWorkerClear: TSpeedButton;
    edtWorkCode: TEdit;
    spbWorkCodeClear: TSpeedButton;
    spbWorkCode: TSpeedButton;
    lblWorkCode: TLabel;
    lblKarta: TLabel;
    edtTKClassificationTypeName: TEdit;
    spbTKClassificationType: TSpeedButton;
    HTTPRIOTKClassificationType: THTTPRIO;
    edtNameCalculation: TEdit;
    chkWithoutTimePays: TCheckBox;
    procedure spbEPRenClearClick(Sender: TObject);
    procedure spbEPRenClick(Sender: TObject);
    procedure spbFINExecutorClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure spbENWorkerWorkerFactClick(Sender: TObject);
    procedure spbWorkCodeClick(Sender: TObject);
    procedure spbFINWorkerClearClick(Sender: TObject);
    procedure spbWorkCodeClearClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbTKClassificationTypeClick(Sender: TObject);
  private
    { Private declarations }
  public
    renCode: Integer;
    renName: String;
    pplankind : Integer;
    report_vid : Integer;

    ENPlanWorkObj: ENPlanWork;
    { Public declarations }
  end;

var
  FrmAnakyseLoadWorker: TFrmAnakyseLoadWorker;
  ENHumenItemObj: ENHumenItem;
  vtabnumber : String;
  workCode : Integer;
  TKClassificationTypeCode : Integer;

implementation

{$R *.dfm}
 uses  FINExecutorController, ShowFINExecutor,
  ShowFINExecutorTree , ShowENDepartment , ENDepartmentController , ChildFormUnit , EnergyproController , DMReportsUnit
  , ENPlanWorkItemController, FINWorkerController,
  ShowFINWorker , ENConsts ,  FINWorkerKindController, ShowTKTechCard, TKTechCardController,
  ShowTKClassificationType, TKClassificationTypeController;

procedure TFrmAnakyseLoadWorker.spbEPRenClearClick(Sender: TObject);
begin
  renCode := 0;
  renName := '';


end;

procedure TFrmAnakyseLoadWorker.spbEPRenClick(Sender: TObject);
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
      with frmENDepartmentShow do begin

        if ShowModal = mrOk then
        begin

          renCode := ENDepartmentShort(tvDep.Selected.Data).code;
          renName := ENDepartmentShort(tvDep.Selected.Data).shortName;

        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;

end;

procedure TFrmAnakyseLoadWorker.spbFINExecutorClick(Sender: TObject);
var
   frmFINExecutorTreeShow: TfrmFINExecutorTreeShow;
 //  f : EditENPlanWorkStateFilter;
begin
   frmFINExecutorTreeShow:=TfrmFINExecutorTreeShow.Create(Application,fmNormal);
   try
      with frmFINExecutorTreeShow do begin
        DisableActions([ actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try
              ENPlanWorkObj.finExecutor :=
                DMReports.finExecutorShort2finExecutor(FINExecutorShort(tvDep.Selected.Data),
                                                       DMReports.getFullExecutorName(tvDep.Selected));
            except
              on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmFINExecutorTreeShow.Free;
   end;
end;

procedure TFrmAnakyseLoadWorker.spbFINWorkerClearClick(Sender: TObject);
begin
  inherited;
  vtabnumber := '0';
  edtENWorkerWorkerFactName.Text := '';
end;

procedure TFrmAnakyseLoadWorker.spbTKClassificationTypeClick(Sender: TObject);
 var
     frmTKClassificationTypeShow: TfrmTKClassificationTypeShow;
begin
   frmTKClassificationTypeShow := TfrmTKClassificationTypeShow.Create(Application, fmNormal);
   try
     DisableActions([frmTKClassificationTypeShow.actNoFilter,
           frmTKClassificationTypeShow.actInsert, frmTKClassificationTypeShow.actEdit,
           frmTKClassificationTypeShow.actDelete]);

     frmTKClassificationTypeShow.techCardSourceCondition := 'tktechcardsource.code = ' + IntToStr(TKTECHCARDSOURCE_CALCULATIONS);

     // SUPP-18899 отныне тестируем калькуляции на работем сервере
     // источник с тестовыми калькуляциями показываем только юзерам из списка
     if ((HTTPRIOTKClassificationType.HTTPWebNode.UserName = 'energynet') or
         // SUPP-26858     KondratenkoOE
         (HTTPRIOTKClassificationType.HTTPWebNode.UserName = 'KondratenkoOE') or
         // SUPP-26856     asu_3 (Федорчак Наталя Юріївна), PalamarIN, TsaturovaLV
         (HTTPRIOTKClassificationType.HTTPWebNode.UserName = 'asu_3') or
         (HTTPRIOTKClassificationType.HTTPWebNode.UserName = 'PalamarIN') or
         (HTTPRIOTKClassificationType.HTTPWebNode.UserName = 'TsaturovaLV') or

         (HTTPRIOTKClassificationType.HTTPWebNode.UserName = 'ZemlianskayaNF') or
         (HTTPRIOTKClassificationType.HTTPWebNode.UserName = 'GavrilenkoNV') or
         (HTTPRIOTKClassificationType.HTTPWebNode.UserName = 'ReznikMV') or
         (HTTPRIOTKClassificationType.HTTPWebNode.UserName = 'HomkoSO') or
         (HTTPRIOTKClassificationType.HTTPWebNode.UserName = 'NazarenkoOY') or
         (HTTPRIOTKClassificationType.HTTPWebNode.UserName = 'PerervaJG') or
         (HTTPRIOTKClassificationType.HTTPWebNode.UserName = 'MihnyukAA') )  then
     frmTKClassificationTypeShow.techCardSourceCondition := 'tktechcardsource.code in (' + IntToStr(TKTECHCARDSOURCE_CALCULATIONS) + ', ' + IntToStr(TKTECHCARDSOURCE_TEST_CALCULATIONS) + ', ' + IntToStr(TKTECHCARDSOURCE_CALCULATIONS_20141201) + ')';


      with frmTKClassificationTypeShow do
        if ShowModal = mrOk then
        begin
            try

               TKClassificationTypeCode := TKClassificationTypeShort(tvDep.Selected.Data).code;
               edtTKClassificationTypeName.Text := TKClassificationTypeShort(tvDep.Selected.Data).kod ;
               edtNameCalculation.Text := TKClassificationTypeShort(tvDep.Selected.Data).name;
            except
               on EConvertError do Exit;
            end;


        end;
   finally
      frmTKClassificationTypeShow.Free;
   end;

end;

procedure TFrmAnakyseLoadWorker.spbWorkCodeClearClick(Sender: TObject);
begin
  inherited;
  edtWorkCode.Text := '';
  workCode := -1;
end;

procedure TFrmAnakyseLoadWorker.spbWorkCodeClick(Sender: TObject);
var
   frmKartiShow: TfrmTKTechCardShow;
begin
  inherited;
     frmKartiShow:=TfrmTKTechCardShow.Create(Application,fmNormal);
     try
      with frmKartiShow do
      begin
        // NET-73 Закрываем любое редактирование техкарт (оставляем только просмотр)
        // (для редактирования есть отдельный клиент!)
        DisableActions([actInsert, actEdit, actDelete]);

        if ShowModal = mrOk then
        begin
            try
              edtWorkCode.Text := GetReturnValue(sgTKTechCard,1) + ' ' + GetReturnValue(sgTKTechCard,2); //GetReturnValue(sgTKTechCard,2);
              workCode := StrToInt(GetReturnValue(sgTKTechCard,0));
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmKartiShow.Free;
   end;

end;

procedure TFrmAnakyseLoadWorker.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  argNames, args: ArrayOfString;
  reportName: String;
  var ys,ms,ds,yf,mf,df: Word;
begin
   if ModalResult = mrOk then
   begin
      if(not edtDateStart.Checked) then
      begin
          Application.MessageBox(PChar('Оберіть дату початку!'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
          Action := caNone;
          Exit;
      end;

        if(not edtDateFinal.Checked) then
      begin
          Application.MessageBox(PChar('Оберіть дату закінчення!'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
          Action := caNone;
          Exit;
      end;

      if(edtDateFinal.Date < edtDateStart.Date) then
      begin
          Application.MessageBox(PChar('Дати повинні бути в хронологічному порядку!'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
          Action := caNone;
          Exit;
      end;

      DecodeDate(edtDateStart.date,ys,ms,ds);
      DecodeDate(edtDateFinal.date,yf,mf,df);


      {if((workCode = -1) and (vtabnumber = '0')) then
      begin
          Application.MessageBox(PChar('Оберіть або код роботи або табельний номер !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
          Action:=caNone;
          Exit;
      end;}


      SetLength(argNames, 5);
      SetLength(args, 5);

      argNames[0] := 'pdate1';
      args[0] := DateToStr( edtDateStart.date );

      argNames[1] := 'pdate2';
      args[1] := DateToStr( edtDateFinal.date );

      argNames[2] := 'tabnumber';
      {SUPP-46814}
      if Length(Trim(edtENWorkerWorkerFactName.Text)) > 0 then
        args[2] := edtENWorkerWorkerFactName.Text
      else
        args[2] := '0';

      argNames[3] := 'workCode';
      args[3] := IntToStr(workCode);

      argNames[4] := 'TKClassificationTypeCode';
      args[4] := IntToStr(TKClassificationTypeCode);

      if chkWithoutTimePays.Checked  then
        reportName := 'AnalysLoadPersWithoutTimePays'
      else
        reportName := 'AnalysLoadPers';

        makeReportAuth(reportName, argNames, args, 'xls')
    end;

end;

procedure TFrmAnakyseLoadWorker.FormCreate(Sender: TObject);
begin
  report_vid:= 0; // сбрасываем вид отчета ... обычный вид или развернутый по персоналу
  DisableControls([ edtWorkCode]);

  workCode := -1;
  vtabnumber := '0';

  TKClassificationTypeCode := 0;
end;

procedure TFrmAnakyseLoadWorker.spbENWorkerWorkerFactClick(
  Sender: TObject);
var
   frmFINWorkerShow: TfrmFINWorkerShow;
   f : FINWorkerFilter;
   plan : ENPlanWork;
   w : FINWorker;
   TempFINWorker: FINWorkerControllerSoapPort;
   eType : Integer;
    ENHumenItemObj: ENHumenItem;
   dateGetdt : tdateTime;
begin

     f :=FINWorkerFilter.Create;
      SetNullIntProps(f);
      SetNullXSProps(f);

    //  if renCode>0 then
    // f.departmentCode :=  IntToStr(0);
     f.departmentCode := '-1';

   frmFINWorkerShow:=TfrmFINWorkerShow.Create(Application,fmNormal,f);
   //frmFINWorkerShow.forReport := True;
   try

   // frmFINWorkerShow.humenKindCode := ENHUMENITEMKIND_ELTEH;
     DisableActions([frmFINWorkerShow.actInsert, frmFINWorkerShow.actEdit, frmFINWorkerShow.actDelete]);
     // dateGetdt := strtodate('01.01.1900');
     frmFINWorkerShow.forReport := True;

     frmFINWorkerShow.dateGet:= TXSDate.Create;
     frmFINWorkerShow.dateGet.XSToNative(GetXSDate(dateGetdt));

//     frmFINWorkerShow.dateGet:= dateGetdt;

      with frmFINWorkerShow do
        if ShowModal = mrOk then
        begin


            try
              edtENWorkerWorkerFactName.Text := GetReturnValue(sgFINWorker,1);
              vtabnumber := GetReturnValue(sgFINWorker,2);


            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmFINWorkerShow.Free;
   end;
end;

end.
