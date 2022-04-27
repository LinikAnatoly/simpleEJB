
unit EditENDamageRecovery;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENDamageRecoveryController, AdvObj, ENDamageRecovery2ENActController,
   FKProvObjectController ;

type
  TfrmENDamageRecoveryEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;


  HTTPRIOENDamageRecovery: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    ActionList1: TActionList;
    actView: TAction;
    actInsert: TAction;
    actDelete: TAction;
    actUpdate: TAction;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N6: TMenuItem;
    ImageList1: TImageList;
    HTTPRIOENDamageRecovery2ENAct: THTTPRIO;
    HTTPRIOENAct: THTTPRIO;
    pcENDamageRecovery: TPageControl;
    tsOveral: TTabSheet;
    lblNumberGen: TLabel;
    lblDateGen: TLabel;
    lblDamageAmmount: TLabel;
    spbENDepartment: TSpeedButton;
    lblENDepartmentName: TLabel;
    edtNumberGen: TEdit;
    edtDateGen: TDateTimePicker;
    edtDamageAmmount: TEdit;
    edtENDepartmentName: TEdit;
    gbWarrant: TGroupBox;
    lblWarrantFIO: TLabel;
    lblWarrantPosition: TLabel;
    spbWarrantNumber: TSpeedButton;
    edtWarrantFIO: TEdit;
    edtWarrantPosition: TEdit;
    gbFK: TGroupBox;
    lblFKcontractCode: TLabel;
    spbContractNumberSelect: TSpeedButton;
    lblFKpartnerCode: TLabel;
    lblFKdocID: TLabel;
    lblCommentGen: TLabel;
    edtFKcontractCode: TEdit;
    edtFKpartnerCode: TEdit;
    edtFKdocID: TEdit;
    edtCommentGen: TMemo;
    gbContragent: TGroupBox;
    lblContragentName: TLabel;
    lblContragentAddress: TLabel;
    lblContragentPassport: TLabel;
    edtContragentName: TEdit;
    edtContragentAddress: TMemo;
    edtContragentPassport: TMemo;
    gbActs: TGroupBox;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton11: TToolButton;
    sgENAct: TAdvStringGrid;
    btnPrintContract: TButton;
    tsFKProv: TTabSheet;
    gbFKPostings: TGroupBox;
    lblDatePosting: TLabel;
    sgFKProvs: TAdvStringGrid;
    sgFKProvErrorsDetailed: TAdvStringGrid;
    btnDeleteFromFK: TButton;
    btnMoveToFK: TButton;
    btnGetPostingsList: TButton;
    edtDatePosting: TDateTimePicker;
    btnChangeDatePosting: TButton;
    HTTPRIOFKProvObject: THTTPRIO;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbContractNumberSelectClick(Sender: TObject);
    procedure spbENDepartmentClick(Sender: TObject);
    procedure spbWarrantNumberClick(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure updateActs;
    procedure actDeleteExecute(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
    procedure btnPrintContractClick(Sender: TObject);
    procedure btnChangeDatePostingClick(Sender: TObject);
    procedure getStatus(damageRecoveryCode: Integer);
    procedure btnMoveToFKClick(Sender: TObject);
    procedure btnDeleteFromFKClick(Sender: TObject);
    procedure getFKPostingsList(damageRecoveryCode: Integer);
    procedure btnGetPostingsListClick(Sender: TObject);
    procedure changeGridDescription(isError: Boolean);
    procedure sgFKProvsClick(Sender: TObject);
  
  
  private
    { Private declarations }
  public
    { Public declarations }
    provResult: FKProvResult;

end;

var
  frmENDamageRecoveryEdit: TfrmENDamageRecoveryEdit;
  ENDamageRecoveryObj: ENDamageRecovery;
  ENDamageRecovery2ENActObj: ENDamageRecovery2ENAct;

implementation

uses ShowFINServicesObject, ENConsts, ENServicesObjectController,
  ShowENDepartment, ENDepartmentController, ShowENWarrant, ENWarrantController,
  DMReportsUnit, ShowENAct, ENActController, EditENAct, ENSettingsConsts;


{uses  
    EnergyproController, EnergyproController2, ENDamageRecoveryController  ;
}
{$R *.dfm}

var
  LastCount: Integer; //ColCount
  LastRow: Integer = 1;
  ENActHeaders: array [1..9] of String =
        ( 'Код'
          ,'Номер акту'
          ,'Дата проведення акту'
          ,'Дата акту'
          ,'Код МОЛ / ФИО мола с фин.кол.'
          ,'Тип'
          ,'Статус'
          ,'пользователь внесший изменение'
          ,'дата последнего изменения'
        );

  BadProvHeaders: array [1..12] of String =
        ('Код'
         ,'Дата'
         ,'Цех (К)'
         ,'Счет (К)'
         ,'Субсчет (К)'
         ,'КАУ (К)'
         ,'Цех (Д)'
         ,'Счет (Д)'
         ,'Субсчет (Д)'
         ,'КАУ (Д)'
         ,'Сумма'
         ,'Примечание'
        );

  ProvErrorDetailedHeaders: array [1..2] of String =
        ('Код'
         ,'Ошибки'
        );


procedure TfrmENDamageRecoveryEdit.updateActs();
var
ColCount, i : Integer;
TempENAct : ENActControllerSoapPort;
  ENActList: ENActShortList;
  aFilter : ENActFilter;
begin

  ClearGrid(sgENAct);

  SetGridHeaders(ENActHeaders, sgENAct.ColumnHeaders);
  ColCount:=100;

  TempENAct :=  HTTPRIOENAct as ENActControllerSoapPort;

     aFilter := ENActFilter.Create;
     SetNullIntProps(aFilter);
     SetNullXSProps(aFilter);
     ENActFilter(aFilter).conditionSQL := 'enact.code in ' +
     '( select endamagerecovery2enact.actrefcode from endamagerecovery2enact' +
     ' where endamagerecovery2enact.damagerecoveryrefcode = ' + IntToStr(ENDamageRecoveryObj.code) + ')';

  ENActList := TempENAct.getScrollableFilteredList(aFilter,0,ColCount);

  LastCount:=High(ENActList.list);

  if LastCount > -1 then
     sgENAct.RowCount:=LastCount+2
  else
     sgENAct.RowCount:=2;

   with sgENAct do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENActList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENActList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENActList.list[i].numberGen;
        if ENActList.list[i].dateGen = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDate2String(ENActList.list[i].dateGen);

          if ENActList.list[i].dateAct = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := XSDate2String(ENActList.list[i].dateAct);

        Cells[4,i+1] :=  ENActList.list[i].finMolCode + ' / ' +  ENActList.list[i].finMolName;

        Cells[5,i+1] := ENActList.list[i].actTypeRefName; //'';
        Cells[6, i+1] := ENActList.list[i].statusRefName;
        Cells[7, i+1] := ENActList.list[i].userGen;

        if ENActList.list[i].dateEdit = nil then
          Cells[8,i+1] := ''
        else
          Cells[8,i+1] := XSDate2String(ENActList.list[i].dateEdit);

        LastRow:=i+1;
        sgENAct.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENAct.Row:=1;

end;

procedure TfrmENDamageRecoveryEdit.FormShow(Sender: TObject);
var
warrant : ENWarrant;
department : ENDepartment;
begin

  DisableControls([edtCode, edtDamageAmmount, edtCommentGen, edtFKpartnerCode,
                   edtFKcontractCode, edtFKdocID, edtWarrantFIO,
                   edtWarrantPosition, edtENDepartmentName]);

  if DialogState = dsInsert then
  begin
     edtDamageAmmount.Text := '0';
     disableActions([actInsert, actDelete]);
     HideControls([btnPrintContract, btnDeleteFromFK,
     btnGetPostingsList, btnMoveToFK, btnChangeDatePosting]);
  end;

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtNumberGen
      ,edtDateGen
      ,edtContragentName
      ,edtContragentAddress
      ,edtContragentPassport
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

     DisableControls([spbENDepartment, spbWarrantNumber, spbContractNumberSelect]);

      edtCode.Text := IntToStr(ENDamageRecoveryObj.code);
    edtNumberGen.Text := ENDamageRecoveryObj.numberGen;
      SetDateFieldForDateTimePicker(edtDateGen, ENDamageRecoveryObj.dateGen);
    edtFKcontractCode.Text := ENDamageRecoveryObj.FKcontractCode;
    edtFKpartnerCode.Text := ENDamageRecoveryObj.FKpartnerCode;

    if ( ENDamageRecoveryObj.FKdocID <> Low(Integer) ) then
       edtFKdocID.Text := IntToStr(ENDamageRecoveryObj.FKdocID)
    else
       edtFKdocID.Text := '';
    MakeMultiline(edtCommentGen.Lines, ENDamageRecoveryObj.commentGen);
    edtContragentName.Text := ENDamageRecoveryObj.contragentName;
    MakeMultiline(edtContragentAddress.Lines, ENDamageRecoveryObj.contragentAddress);
    MakeMultiline(edtContragentPassport.Lines, ENDamageRecoveryObj.contragentPassport);

    if ( ENDamageRecoveryObj.damageAmmount <> nil ) then
       edtDamageAmmount.Text := ENDamageRecoveryObj.damageAmmount.decimalString
    else
       edtDamageAmmount.Text := '';

    if  ENDamageRecoveryObj.warrantRef.code <> LOW_INT then
    begin
      warrant := DMReports.getWarrantByCode(ENDamageRecoveryObj.warrantRef.code);

      edtWarrantFIO.Text := warrant.warrantFIO;
      edtWarrantPosition.Text := warrant.warrantPosition;
    end;

    if ENDamageRecoveryObj.department.code <> LOW_INT then
    begin
       department :=  DMReports.getDepartmentByCode(ENDamageRecoveryObj.department.code);
       edtENDepartmentName.Text := department.shortName;
    end;

     SetDateFieldForDateTimePicker(edtDatePosting, ENDamageRecoveryObj.datePosting);

     getStatus(ENDamageRecoveryObj.code);
     getFKPostingsList(ENDamageRecoveryObj.code);
  end;

  updateActs;

end;



procedure TfrmENDamageRecoveryEdit.sgFKProvsClick(Sender: TObject);
var provId, i, j: Integer;
begin
  ClearGrid(sgFKProvErrorsDetailed);

  try
    provId := StrToInt(sgFKProvs.Cells[0, sgFKProvs.Row]);
  except
    on EConvertError do Exit;
  end;

  if provResult = nil then Exit;
  if provResult.partId > LOW_INT then Exit;

  for i := 0 to High(provResult.badProvList.list) do
  begin
    if provResult.badProvList.list[i].id = provId then
    begin
      if High(provResult.badProvList.list[i].detailedList.list) > -1 then
        sgFKProvErrorsDetailed.RowCount := High(provResult.badProvList.list[i].detailedList.list) + 2
      else
        sgFKProvErrorsDetailed.RowCount := 2;

      with sgFKProvErrorsDetailed do
        for j := 0 to High(provResult.badProvList.list[i].detailedList.list) do
        begin
          if provResult.badProvList.list[i].detailedList.list[j].prov_id <> Low(Integer) then
            Cells[0,j+1] := IntToStr(provResult.badProvList.list[i].detailedList.list[j].prov_id)
          else
            Cells[0,j+1] := '';
          Cells[1,j+1] := provResult.badProvList.list[i].detailedList.list[j].err_mes;
        end;

      break;
    end;
  end;
end;

procedure TfrmENDamageRecoveryEdit.spbContractNumberSelectClick(
  Sender: TObject);
var
   frmFINServicesObjectShow: TfrmFINServicesObjectShow;
   f : ENServicesObjectFilter;
begin

   f := ENServicesObjectFilter.Create();
   SetNullXSProps(f);
   SetNullIntProps(f);
   f.conditionSQL := ' a.in_num = ''' + DMReports.getSettingValueByKey(AGREE_FOR_DAMAGE_RECOVERY) + '''';
         // a.io_flag = ''S'' and  a.agree_group_id in (' + AGREES_GROUPS_IDS + ')'

   frmFINServicesObjectShow:= TfrmFINServicesObjectShow.Create(Application,fmNormal, f);
   frmFINServicesObjectShow.contrAgentType := AX_CONTRAGENT_TYPE_CUSTOMER;
   try
      with frmFINServicesObjectShow do
        if ShowModal = mrOk then
        begin
            try

                edtFKcontractCode.Text := GetReturnValue(sgFINServicesObject, 1);

                if edtDateGen.Checked = false then
                begin
                    edtDateGen.DateTime := StrToDate(GetReturnValue(sgFINServicesObject, 2));
                    edtDateGen.Checked := true;
                end;

                edtFKpartnerCode.Text := GetReturnValue(sgFINServicesObject, 4);
                ENDamageRecoveryObj.FKdocCode :=  GetReturnValue(sgFINServicesObject, 5);
                edtFKDocID.Text :=  GetReturnValue(sgFINServicesObject, 6);
                edtCommentGen.Text :=  GetReturnValue(sgFINServicesObject, 7);

                if  edtNumberGen.Text = '' then
                edtNumberGen.Text := edtFKcontractCode.Text;

                if (edtContragentName.Text = '') then
                   edtContragentName.Text := GetReturnValue(sgFINServicesObject, 3);

                DisableControls([edtCode
                                 ,edtFKcontractCode
                                 ,edtFKpartnerCode
                                 ,edtFKDocID
                                 ,edtCommentGen
                                ]);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmFINServicesObjectShow.Free;
   end;
end;

procedure TfrmENDamageRecoveryEdit.spbENDepartmentClick(
  Sender: TObject);
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
               if ENDamageRecoveryObj.department = nil then ENDamageRecoveryObj.department := ENDepartmentRef.Create();

               if ENDepartmentShort(tvDep.Selected.Data).code <> ENDamageRecoveryObj.department.code  then
                  begin
                    if  ENDamageRecoveryObj.warrantRef = nil then
                    ENDamageRecoveryObj.warrantRef := ENWarrantRef.Create;
                    ENDamageRecoveryObj.warrantRef.code := LOW_INT;
                    edtWarrantFIO.Text := '';
                    edtWarrantPosition.Text := '';
                  end;

               ENDamageRecoveryObj.department.code := ENDepartmentShort(tvDep.Selected.Data).code;
               edtENDepartmentName.Text := ENDepartmentShort(tvDep.Selected.Data).shortName;
            except
               on EConvertError do Exit;
            end;

        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;
end;

procedure TfrmENDamageRecoveryEdit.spbWarrantNumberClick(Sender: TObject);
var frmENWarrantShow : TfrmENWarrantShow;
    f : ENWarrantFilter;
    warrant : ENWarrant;
    datContract, datWarrant : TXSDate;
    dtdatContract, dtdatWarrant : TDateTime;
    power: Double;
begin
     if (ENDamageRecoveryObj.department = nil) or (ENDamageRecoveryObj.department.code = LOW_INT) then
     begin
        Application.MessageBox(PChar('Оберіть підрозділ!!!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
        exit;
     end;

     if (edtDateGen = nil) or (edtDateGen.Checked = false) then
     begin
        Application.MessageBox(PChar('Оберіть дату акту!!!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
        exit;
     end;

     datContract := TXSDate.Create;
     datWarrant := TXSDate.Create;

     f := ENWarrantFilter.Create();
     SetNullXSProps(f);
     SetNullIntProps(f);
     f.departmentRef := ENDepartmentRef.Create();
     f.departmentRef.code := ENDamageRecoveryObj.department.code;
     f.conditionSQL := ' warrantstatusrefcode = 0';

     frmENWarrantShow := TfrmENWarrantShow.Create(Application,fmNormal, f);
     DisableActions([frmENWarrantShow.actNoFilter]);

     try
        with frmENWarrantShow do
          if ShowModal = mrOk then
          begin
              try

                 ENDamageRecoveryObj.warrantRef := ENWarrantRef.Create();
                 ENDamageRecoveryObj.warrantRef.code := StrToInt(GetReturnValue(sgENWarrant,0));

                  if  ENDamageRecoveryObj.warrantRef.code <> LOW_INT then
                  begin
                    warrant := DMReports.getWarrantByCode(ENDamageRecoveryObj.warrantRef.code);

                    datContract.XSToNative(GetXSDate(self.edtDateGen.DateTime));
                    dtdatContract := EncodeDate(datContract.Year, datContract.Month, datContract.Day);
                    dtdatWarrant := EncodeDate(warrant.dateFinal.Year, warrant.dateFinal.Month, warrant.dateFinal.Day);

                    if (warrant.warrantStatusRef.code = WARRANT_INVALID) then
                    begin
                      Application.MessageBox(PChar('Довіреність недійсна!!!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);

                        edtWarrantFIO.Text := '';
                        edtWarrantPosition.Text := '';
                        ENDamageRecoveryObj.warrantRef.code := LOW_INT;
                      Exit;
                    end;

                    if (dtdatContract > dtdatWarrant) then
                    begin
                      Application.MessageBox(PChar('Термін дії довіреності закінчився!!!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
                        edtWarrantFIO.Text := '';
                        edtWarrantPosition.Text := '';
                        ENDamageRecoveryObj.warrantRef.code := LOW_INT;
                      Exit;
                    end;

                  end;

                  edtWarrantFIO.Text := GetReturnValue(sgENWarrant,3);
                  edtWarrantPosition.Text := GetReturnValue(sgENWarrant,4);

              except
                 on EConvertError do Exit;
              end;
          end;
     finally
        frmENWarrantShow.Free;
     end;

end;

procedure TfrmENDamageRecoveryEdit.actDeleteExecute(Sender: TObject);
Var TempENDamageRecovery2ENAct: ENDamageRecovery2ENActControllerSoapPort;
TempENDamageRecovery : ENDamageRecoveryControllerSoapPort;
  actCode, damageCode: Integer;
begin
 TempENDamageRecovery2ENAct := HTTPRIOENDamageRecovery2ENAct as ENDamageRecovery2ENActControllerSoapPort;
   try
     actCode := StrToInt(sgENAct.Cells[0,sgENAct.Row]);
     damageCode := ENDamageRecoveryObj.code;
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Зв`язок акту відшкодування збитків з актами виконаних робіт) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENDamageRecovery2ENAct.remove(actCode, damageCode);
      updateActs();

      TempENDamageRecovery := HTTPRIOENDamageRecovery as ENDamageRecoveryControllerSoapPort;
      ENDamageRecoveryObj :=  TempENDamageRecovery.getObject(ENDamageRecoveryObj.code);
      FormShow(Sender);
  end;
end;

procedure TfrmENDamageRecoveryEdit.actInsertExecute(Sender: TObject);
var  TempENDamageRecovery2ENAct: ENDamageRecovery2ENActControllerSoapPort;
TempENDamageRecovery : ENDamageRecoveryControllerSoapPort;
  frmENActShow : TfrmENActShow;
begin
  inherited;

   frmENActShow:=TfrmENActShow.Create(Application,fmNormal);
   try

      with frmENActShow do begin
        DisableActions([ actInsert, actEdit, actDelete, actNoFilter]);
        if ShowModal = mrOk then
        begin

          if ENDamageRecovery2ENActObj = nil then
          ENDamageRecovery2ENActObj := ENDamageRecovery2ENAct.Create;

          ENDamageRecovery2ENActObj.damageRecoveryRef := ENDamageRecoveryRef.Create;
          ENDamageRecovery2ENActObj.damageRecoveryRef.code := ENDamageRecoveryObj.code;

          ENDamageRecovery2ENActObj.actRef := ENActRef.Create;
          ENDamageRecovery2ENActObj.actRef.code := StrToInt(GetReturnValue(sgENAct,0));

          TempENDamageRecovery2ENAct := HTTPRIOENDamageRecovery2ENAct as ENDamageRecovery2ENActControllerSoapPort;
          TempENDamageRecovery2ENAct.add(ENDamageRecovery2ENActObj);
          Self.updateActs;

        end
      end;
   finally
    frmENActShow.Free;
    frmENActShow:=nil;
   end;

   TempENDamageRecovery := HTTPRIOENDamageRecovery as ENDamageRecoveryControllerSoapPort;
   ENDamageRecoveryObj :=  TempENDamageRecovery.getObject(ENDamageRecoveryObj.code);
   self.FormShow(Sender);

end;

procedure TfrmENDamageRecoveryEdit.actUpdateExecute(Sender: TObject);
begin
  inherited;
  updateActs;
end;

procedure TfrmENDamageRecoveryEdit.actViewExecute(Sender: TObject);
Var TempENAct: ENActControllerSoapPort;
begin
  TempENAct := HTTPRIOENAct as ENActControllerSoapPort;
  frmENActEdit := TfrmENActEdit.Create(Application, dsView);
  try
    try
      frmENActEdit.ENActObj := TempENAct.getObject(StrToInt(sgENAct.Cells[0, sgENAct.Row]));
    except
      on EConvertError do Exit;
    end;

    if frmENActEdit.ShowModal in [mrOk ,mrYes ] then
      begin
        updateActs();
      end;

  finally
    frmENActEdit.Free;
    frmENActEdit:=nil;
  end;
end;

procedure TfrmENDamageRecoveryEdit.btnChangeDatePostingClick(Sender: TObject);
var TempENDamageRecoveryController: ENDamageRecoveryControllerSoapPort;
begin
  if ENDamageRecoveryObj = nil then Exit;
  if ENDamageRecoveryObj.code = LOW_INT then Exit;

  if Application.MessageBox(PChar('Ви дійсно бажаєте змінити дату проведення документа?'),
          PChar('Увага!'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) <> IDOK then
  Exit;

  TempENDamageRecoveryController := HTTPRIOENDamageRecovery as ENDamageRecoveryControllerSoapPort;

  if (not NoBlankValues([edtDatePosting])) then
  begin
    Application.MessageBox(PChar('Вкажіть дату!'),PChar('Увага!'),MB_ICONWARNING+MB_OK);
    Exit;
  end else
  begin
    ENDamageRecoveryObj.datePosting  := TXSDate.Create;
    ENDamageRecoveryObj.datePosting.XSToNative(GetXSDate(edtDatePosting.DateTime));
    TempENDamageRecoveryController.changeDatePosting(ENDamageRecoveryObj);
  end;

  getStatus(ENDamageRecoveryObj.code);

end;

procedure TfrmENDamageRecoveryEdit.getStatus(damageRecoveryCode: Integer);
var TempENDamageRecoveryController: ENDamageRecoveryControllerSoapPort;
begin
  HideControls([btnMoveToFK, btnDeleteFromFK]);

  if ENDamageRecoveryObj.code > LOW_INT then
  begin
    TempENDamageRecoveryController := HTTPRIOENDamageRecovery as ENDamageRecoveryControllerSoapPort;
    ENDamageRecoveryObj := TempENDamageRecoveryController.getObject(ENDamageRecoveryObj.code);

    if ENDamageRecoveryObj.datePosting <> nil then
      begin
        edtDatePosting.DateTime := EncodeDate(ENDamageRecoveryObj.datePosting.Year,ENDamageRecoveryObj.datePosting.Month,ENDamageRecoveryObj.datePosting.Day);
        edtDatePosting.checked := true;
      end
    else
      begin
        edtDatePosting.DateTime := SysUtils.Date;
        edtDatePosting.checked := false;
      end;

      if ENDamageRecoveryObj.statusRef.code = ENDAMAGERECOVERY_STATUS_DRAFT then
    begin
      HideControls([btnMoveToFK, btnChangeDatePosting, lblDatePosting,
      edtDatePosting, btnDeleteFromFK, gbFKPostings]);
      DisableControls([edtDatePosting], false);
    end;

    if ENDamageRecoveryObj.statusRef.code = ENDAMAGERECOVERY_STATUS_SUM_CALCULATED then
    begin
      HideControls([btnMoveToFK, btnChangeDatePosting, lblDatePosting, edtDatePosting], false);
      HideControls([btnDeleteFromFK]);
      DisableControls([edtDatePosting], false);
    end;

    if ENDamageRecoveryObj.statusRef.code = ENDAMAGERECOVERY_STATUS_CLOSED then
    begin
      HideControls([btnMoveToFK, btnChangeDatePosting]);
      HideControls([btnDeleteFromFK, lblDatePosting, edtDatePosting], false);
      btnDeleteFromFK.Left := 16;
      DisableControls([edtDatePosting], true);
    end;

  end;

end;

procedure TfrmENDamageRecoveryEdit.btnDeleteFromFKClick(Sender: TObject);
var TempENDamageRecoveryController: ENDamageRecoveryControllerSoapPort;
begin
  if ENDamageRecoveryObj.code = LOW_INT then Exit;

  if (ENDamageRecoveryObj.statusRef.code <> ENDAMAGERECOVERY_STATUS_CLOSED) then
  begin
    Application.MessageBox(PChar('Цей Акт ще не проведений!'),
                           PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте ВІДМІНИТИ проведення документів у Фін. Колекції ?'),
                            PChar('Увага!'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) <> IDOK then
    Exit;

  TempENDamageRecoveryController := HTTPRIOENDamageRecovery as ENDamageRecoveryControllerSoapPort;
  TempENDamageRecoveryController.deletePostingFromFK(ENDamageRecoveryObj.code);

  Application.MessageBox(PChar('Документи відмінено!'), PChar('Інформація'), MB_ICONINFORMATION);

  getStatus(ENDamageRecoveryObj.code);

  getFKPostingsList(ENDamageRecoveryObj.code);
end;

procedure TfrmENDamageRecoveryEdit.getFKPostingsList(damageRecoveryCode: Integer);
var i: Integer;
    TempENDamageRecoveryController : ENDamageRecoveryControllerSoapPort;
    fkProvList : FKProvObjectShortList;
begin
  ClearGrid(sgFKProvs);
  ClearGrid(sgFKProvErrorsDetailed);

  TempENDamageRecoveryController := HTTPRIOENDamageRecovery as ENDamageRecoveryControllerSoapPort;

  try
    fkProvList := TempENDamageRecoveryController.getFKPostingsList(ENDamageRecoveryObj.code);
  except
    on EConvertError do Exit;
  end;

  HideControls([gbFKPostings], False);

  if fkProvList = nil then Exit;

  if High(fkProvList.list) > -1 then
    sgFKProvs.RowCount := High(fkProvList.list) + 2
  else
    sgFKProvs.RowCount := 2;

  with sgFKProvs do
    for i := 0 to High(fkProvList.list) do
    begin
       if fkProvList.list[i].id <> Low(Integer) then
        Cells[0,i+1] := IntToStr(fkProvList.list[i].id)
      else
        Cells[0,i+1] := '';
      if fkProvList.list[i].dt_prov = nil then
        Cells[1,i+1] := ''
      else
        Cells[1,i+1] := XSDate2String(fkProvList.list[i].dt_prov);
      Cells[2,i+1] := fkProvList.list[i].bal_ceh;
      Cells[3,i+1] := fkProvList.list[i].bal_sch;
      Cells[4,i+1] := fkProvList.list[i].bal_sub_sch;
      Cells[5,i+1] := fkProvList.list[i].bal_kau;
      Cells[6,i+1] := fkProvList.list[i].kor_ceh;
      Cells[7,i+1] := fkProvList.list[i].kor_sch;
      Cells[8,i+1] := fkProvList.list[i].kor_sub_sch;
      Cells[9,i+1] := fkProvList.list[i].kor_kau;
      if fkProvList.list[i].summa = nil then
        Cells[10,i+1] := ''
      else
        Cells[10,i+1] := fkProvList.list[i].summa.DecimalString;
      Cells[11,i+1] := fkProvList.list[i].primechan;
    end;
end;


procedure TfrmENDamageRecoveryEdit.btnGetPostingsListClick(Sender: TObject);
begin
  inherited;
  getFKPostingsList(ENDamageRecoveryObj.code);
end;

procedure TfrmENDamageRecoveryEdit.changeGridDescription(isError: Boolean);
begin
  if not isError then
  begin
    gbFKPostings.Caption := 'Список проводок';
    gbFKPostings.Font.Color := clWindowText;
  end
  else begin
    gbFKPostings.Caption := 'Список ошибочных проводок';
    gbFKPostings.Font.Color := clRed;
  end;

  sgFKProvErrorsDetailed.Visible := isError;
end;

procedure TfrmENDamageRecoveryEdit.btnMoveToFKClick(Sender: TObject);
var TempENDamageRecoveryController: ENDamageRecoveryControllerSoapPort;
    i: Integer;
    provList: FKProvObjectShortList;
begin
  if ENDamageRecoveryObj = nil then Exit;
  if ENDamageRecoveryObj.code = LOW_INT then Exit;

  if (ENDamageRecoveryObj.statusRef.code = ENDAMAGERECOVERY_STATUS_CLOSED) then
  begin
    Application.MessageBox(PChar('Цей акт вже проведений!'),
                           PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте ПРОВЕСТИ документи в Фін. Колекції ?'),
                            PChar('Увага!'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) <> IDOK then
    Exit;


  TempENDamageRecoveryController := HTTPRIOENDamageRecovery as ENDamageRecoveryControllerSoapPort;

  provResult := TempENDamageRecoveryController.movePostingToFK(ENDamageRecoveryObj.code);

  ClearGrid(sgFKProvs);
  ClearGrid(sgFKProvErrorsDetailed);

  if provResult <> nil then
    if provResult.partId = LOW_INT then
    begin
      changeGridDescription(true);

      if High(provResult.badProvList.list) > -1 then
        sgFKProvs.RowCount := High(provResult.badProvList.list) + 2
      else
        sgFKProvs.RowCount := 2;

      with sgFKProvs do
        for i := 0 to High(provResult.badProvList.list) do
        begin
          if provResult.badProvList.list[i].id <> Low(Integer) then
            Cells[0,i+1] := IntToStr(provResult.badProvList.list[i].id)
          else
            Cells[0,i+1] := '';
          if provResult.badProvList.list[i].dt_prov = nil then
            Cells[1,i+1] := ''
          else
            Cells[1,i+1] := XSDate2String(provResult.badProvList.list[i].dt_prov);
          Cells[2,i+1] := provResult.badProvList.list[i].bal_ceh;
          Cells[3,i+1] := provResult.badProvList.list[i].bal_sch;
          Cells[4,i+1] := provResult.badProvList.list[i].bal_sub_sch;
          Cells[5,i+1] := provResult.badProvList.list[i].bal_kau;
          Cells[6,i+1] := provResult.badProvList.list[i].kor_ceh;
          Cells[7,i+1] := provResult.badProvList.list[i].kor_sch;
          Cells[8,i+1] := provResult.badProvList.list[i].kor_sub_sch;
          Cells[9,i+1] := provResult.badProvList.list[i].kor_kau;
          if provResult.badProvList.list[i].summa = nil then
            Cells[10,i+1] := ''
          else
            Cells[10,i+1] := provResult.badProvList.list[i].summa.DecimalString;
          Cells[11,i+1] := provResult.badProvList.list[i].primechan;

        end; // for i := 0 to High(provResult.badProvList.list)

        sgFKProvsClick(Sender);
    end // if provResult.partId = LOW_INT
    else begin
      changeGridDescription(false);
      getFKPostingsList(ENDamageRecoveryObj.code);
      getStatus(ENDamageRecoveryObj.code);

      Application.MessageBox(PChar('Документи проведено! Код пачки проводок: ' + IntToStr(provResult.partId)),
                             PChar('Інформація'), MB_ICONINFORMATION);
    end; // else
//  ShowMessage('FINISHED !!! ' + IntToStr(provResult.partId));
end;

procedure TfrmENDamageRecoveryEdit.btnPrintContractClick(Sender: TObject);
var argNames, args: ArrayOfString;
    reportName: String;
begin
  SetLength(argNames, 1);
  SetLength(args, 1);

  argNames[0] := 'damageRecoveryCode';
  args[0] := IntToStr(ENDamageRecoveryObj.code);

  reportName :=  'damageRecovery/damageRecoveryBillAgree';
  makeReport(reportName , argNames , args , 'pdf');
end;

procedure TfrmENDamageRecoveryEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENDamageRecovery: ENDamageRecoveryControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtNumberGen
      ,edtFKcontractCode
      ,edtFKpartnerCode
      ,edtFKdocID
      ,edtDateGen
      ,edtENDepartmentName
      ,edtWarrantFIO
      ,edtWarrantPosition
      ,edtContragentName
      ,edtContragentAddress
      ,edtContragentPassport
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENDamageRecovery := HTTPRIOENDamageRecovery as ENDamageRecoveryControllerSoapPort;


     ENDamageRecoveryObj.numberGen := edtNumberGen.Text; 

     ENDamageRecoveryObj.dateGen := GetTXSDateFromTDateTimePicker(edtdateGen);

     ENDamageRecoveryObj.FKcontractCode := edtFKcontractCode.Text; 

     ENDamageRecoveryObj.FKpartnerCode := edtFKpartnerCode.Text; 


     if ( edtFKdocID.Text <> '' ) then
       ENDamageRecoveryObj.FKdocID := StrToInt(edtFKdocID.Text)
     else
       ENDamageRecoveryObj.FKdocID := Low(Integer) ;

     ENDamageRecoveryObj.commentGen := edtCommentGen.Text; 

     ENDamageRecoveryObj.contragentName := edtContragentName.Text; 

     ENDamageRecoveryObj.contragentAddress := edtContragentAddress.Text;

     ENDamageRecoveryObj.contragentPassport := edtContragentPassport.Text; 

     if (ENDamageRecoveryObj.damageAmmount = nil ) then
       ENDamageRecoveryObj.damageAmmount := TXSDecimal.Create;
     if edtDamageAmmount.Text <> '' then
       ENDamageRecoveryObj.damageAmmount.decimalString := edtDamageAmmount.Text 
     else
       ENDamageRecoveryObj.damageAmmount := nil;

    if DialogState = dsInsert then
    begin
      ENDamageRecoveryObj.code:=low(Integer);
      TempENDamageRecovery.add(ENDamageRecoveryObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENDamageRecovery.save(ENDamageRecoveryObj);
    end;
  end;
end;


end.