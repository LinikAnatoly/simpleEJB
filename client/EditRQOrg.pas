
unit EditRQOrg;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQOrgController, AdvObj, TB2Item,
  TB2Dock, TB2Toolbar, RQOrgRschetController;

type
  TfrmRQOrgEdit = class(TDialogForm)

    lblId : TLabel;
    edtId: TEdit;
    lblName : TLabel;
    edtName: TEdit;
    lblUkr_name : TLabel;
    edtUkr_name: TEdit;
    lblOkpo : TLabel;
    edtOkpo: TEdit;
    lblNalog_num : TLabel;
    edtNalog_num: TEdit;
    lblAdr : TLabel;
    edtAdr: TEdit;
    lblTel : TLabel;
    edtTel: TEdit;
    lblCountry : TLabel;
    edtCountry: TEdit;
    lblRegion : TLabel;
    edtRegion: TEdit;
    lblMinistry : TLabel;
    edtMinistry: TEdit;
    lblPrimechan : TLabel;
    edtPrimechan: TEdit;


  HTTPRIORQOrg: THTTPRIO;
    Label1: TLabel;
    edtAdr_Legal: TEdit;
    gbIs_Plat_NDS: TGroupBox;
    edtSvidet_num: TEdit;
    lblSvidet_num: TLabel;
    chbIs_Plat_NDS: TCheckBox;
    lblDate_svidet: TLabel;
    dtpDate_svidet: TDateTimePicker;
    chbBudget_flag: TCheckBox;
    chbPerson_type: TCheckBox;
    chbExcept_flag: TCheckBox;
    lblNalog_code_filial: TLabel;
    edtNalog_code_filial: TEdit;
    dtpDate_nalogform: TDateTimePicker;
    lblDate_nalogform: TLabel;
    lblNalogForm: TLabel;
    edtNalogForm: TEdit;
    spbNalogForm: TSpeedButton;
    lblOwnership: TLabel;
    spbOwnership: TSpeedButton;
    edtOwnership: TEdit;
    lblOrg_type: TLabel;
    spbOrg_type: TSpeedButton;
    edtOrg_type: TEdit;
    lblMaster_code: TLabel;
    spbMaster_code: TSpeedButton;
    edtMaster_code: TEdit;
    lblContragentType: TLabel;
    cbContragentType: TComboBox;
    gbRSchet: TGroupBox;
    sgRQOrgRschet: TAdvStringGrid;
    ImageList1: TImageList;
    ActionList1: TActionList;
    actView: TAction;
    actInsert: TAction;
    actEdit: TAction;
    actDelete: TAction;
    actUpdate: TAction;
    tbActions: TTBToolbar;
    TBItem5: TTBItem;
    TBItem6: TTBItem;
    TBItem47: TTBItem;
    TBItem7: TTBItem;
    TBItem46: TTBItem;
    HTTPRIORQOrgRschet: THTTPRIO;
    pcRQOrg: TPageControl;
    tsMain: TTabSheet;
    btnOk: TButton;
    btnCancel: TButton;
    edtCode: TEdit;
    lblCode: TLabel;
    tsRQContact: TTabSheet;
    tsENDepartment2Org: TTabSheet;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton11: TToolButton;
    sgRQContact: TAdvStringGrid;
    tbENDepartment2Org: TToolBar;
    ToolButton3: TToolButton;
    ToolButton5: TToolButton;
    ToolButton9: TToolButton;
    sgENDepartment2Org: TAdvStringGrid;
    actRQContactView: TAction;
    actRQContactInsert: TAction;
    actRQContactEdit: TAction;
    actRQContactDelete: TAction;
    actRQContactUpdate: TAction;
    actENDepartment2OrgInsert: TAction;
    actENDepartment2OrgDelete: TAction;
    actENDepartment2OrgUpdate: TAction;
    HTTPRIORQContact: THTTPRIO;
    HTTPRIOENDepartment2Org: THTTPRIO;
    tbConvertToIban: TTBItem;
    actConvertToIban: TAction;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbNalogFormClick(Sender: TObject);
    procedure spbOwnershipClick(Sender: TObject);
    procedure spbOrg_typeClick(Sender: TObject);
    procedure spbMaster_codeClick(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actRQContactInsertExecute(Sender: TObject);
    procedure actRQContactUpdateExecute(Sender: TObject);
    procedure pcRQOrgChange(Sender: TObject);
    procedure actENDepartment2OrgUpdateExecute(Sender: TObject);
    procedure actENDepartment2OrgDeleteExecute(Sender: TObject);
    procedure actENDepartment2OrgInsertExecute(Sender: TObject);
    procedure actRQContactDeleteExecute(Sender: TObject);
    procedure actRQContactEditExecute(Sender: TObject);
    procedure actRQContactViewExecute(Sender: TObject);
    procedure actConvertToIbanExecute(Sender: TObject);

  
  private
    { Private declarations }
    function getRSchetList : RQOrgRschetShortList;
    procedure UpdateRSchetList;
  public
    { Public declarations }
    RQOrgObj: RQOrg;
  end;

var
  frmRQOrgEdit: TfrmRQOrgEdit;
  //RQOrgObj: RQOrg;

implementation

uses ShowNalogForm, ShowOwnership, ShowOrg_types, ShowRQOrg, ENConsts,
  EditRQOrgRschet, EditRQContact
  , RQContactController, ENDepartment2OrgController, ShowENDepartment
  , ENDepartmentController;


{uses  
    EnergyproController, EnergyproController2, RQOrgController  ;
}
{$R *.dfm}

var
  RQOrgRschetHeaders: array [1..9] of String =
        ( 'Код'
          ,'МФО'
          ,'Р/счет'
          ,'Банк'
          ,'Примечание'
          ,'Валюта'
          ,'Дата закрытия'
          ,'Транз/обычн'
          ,'Тип р/с'
        );

    RQContactHeaders: array [1..4] of String =
        ( 'Код'
          ,'Значення'
          ,'Тип'
          ,'Дата втрати актуальності'
        );

    ENDepartment2OrgHeaders: array [1..2] of String =
        ( 'Код'
          , 'Найменування підрозділу'
        );

function TfrmRQOrgEdit.getRSchetList : RQOrgRschetShortList;
var
  TempRQOrgRschet: RQOrgRschetControllerSoapPort;
  rschetFilter: RQOrgRschetFilter;
begin
  if DialogState = dsInsert then Exit;
  if RQOrgObj = nil then Exit;
  if RQOrgObj.id = LOW_INT then Exit;

  TempRQOrgRschet := HTTPRIORQOrgRschet as RQOrgRschetControllerSoapPort;

  rschetFilter := RQOrgRschetFilter.Create;
  SetNullIntProps(rschetFilter);
  SetNullXSProps(rschetFilter);

  rschetFilter.orgId := RQOrgObj.id;
  rschetFilter.axOrgAccount := RQOrgObj.axOrgCode;

  Result := TempRQOrgRschet.getOrgRschetBankList(rschetFilter, 0, -1);
end;

procedure TfrmRQOrgEdit.FormShow(Sender: TObject);
begin
  SetIntStyle([edtNalog_code_filial]);
  SetGridHeaders(RQOrgRschetHeaders, sgRQOrgRschet.ColumnHeaders);

  pcRQOrg.ActivePage := tsMain;

  edtName.SetFocus;

  if DialogState = dsView then
  begin
    DisableActions([actInsert, actEdit, actDelete, actRQContactInsert, actRQContactEdit, actRQContactDelete, actENDepartment2OrgInsert, actENDepartment2OrgDelete]);
    DisableControls([spbMaster_code, spbNalogForm, spbOwnership, spbOrg_type]);
    // Пока мы тянем список из ФК, мы не можем определить, кто это - клиент или поставщик
    HideControls([lblContragentType, cbContragentType]);
  end;

  if DialogState = dsInsert then begin
    HideControls([lblCode, edtCode, gbRSchet]);

    tsRQContact.TabVisible := False;
    tsENDepartment2Org.TabVisible := False;

  end;

  // На редактирование откроем только расчетные счета
  if DialogState = dsEdit then
  begin
    DisableControlChildren(tsMain);
    DisableControls([gbRSchet, btnOk, btnCancel], false);
    // Пока мы тянем список из ФК, мы не можем определить, кто это - клиент или поставщик
    HideControls([lblContragentType, cbContragentType]);
  end;
    
  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DisableControls([edtCode, edtNalogForm, edtOwnership, edtOrg_type, edtMaster_code]);

    DenyBlankValues([
      edtName
      ,edtUkr_name
      ,edtOkpo
      ,edtNalog_num
      //,edtSvidet_num
      ,edtAdr
      ,edtNalogForm
      ,edtOwnership
      ,edtOrg_type
     ]);
  end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    if ( RQOrgObj.id <> Low(Integer) ) then
       edtId.Text := IntToStr(RQOrgObj.id)
    else
       edtId.Text := '';
    edtCode.Text := RQOrgObj.codeorg;
    edtName.Text := RQOrgObj.name;
    edtUkr_name.Text := RQOrgObj.ukr_name; 
    edtOkpo.Text := RQOrgObj.okpo; 
    edtNalog_num.Text := RQOrgObj.nalog_num; 
    edtSvidet_num.Text := RQOrgObj.svidet_num; 
    edtAdr.Text := RQOrgObj.adr; 
    edtTel.Text := RQOrgObj.tel; 
    edtCountry.Text := RQOrgObj.country; 
    edtRegion.Text := RQOrgObj.region; 
    edtMinistry.Text := RQOrgObj.ministry; 
    edtPrimechan.Text := RQOrgObj.Primechan; 

    UpdateRSchetList;
  end;
end;



procedure TfrmRQOrgEdit.pcRQOrgChange(Sender: TObject);
begin
  inherited;
  if pcRQOrg.ActivePage = tsMain  then begin
     actUpdateExecute(Sender);
  end else if pcRQOrg.ActivePage = tsRQContact then begin
    actRQContactUpdateExecute(Sender);
  end else if pcRQOrg.ActivePage = tsENDepartment2Org then begin
    actENDepartment2OrgUpdateExecute(Sender);
  end;


end;

procedure TfrmRQOrgEdit.spbMaster_codeClick(Sender: TObject);
var
  frmRQOrgShow: TfrmRQOrgShow;
begin
  frmRQOrgShow := TfrmRQOrgShow.Create(Application, fmNormal);
  try
    {
    if cbContragentType.ItemIndex = 0 then
      frmRQOrgShow.contrAgentType := AX_CONTRAGENT_TYPE_CUSTOMER
    else if cbContragentType.ItemIndex = 1 then
      frmRQOrgShow.contrAgentType := AX_CONTRAGENT_TYPE_VENDOR
    else
      raise Exception.Create('Некорректный тип контрагента!');
    }

    with frmRQOrgShow do
      if ShowModal = mrOk then
      begin
        RQOrgObj.master_code := GetReturnValue(sgRQOrg, 8);
        edtMaster_code.Text := GetReturnValue(sgRQOrg, 1);
      end;
  finally
    frmRQOrgShow.Free;
  end;
end;

procedure TfrmRQOrgEdit.spbNalogFormClick(Sender: TObject);
var
  frmNalogFormShow: TfrmNalogFormShow;
begin
  frmNalogFormShow := TfrmNalogFormShow.Create(Application, fmNormal);
  try
    with frmNalogFormShow do
      if ShowModal = mrOk then
      begin
        try
          RQOrgObj.id_nalogform := StrToInt(GetReturnValue(sgNalogForm, 1));
          edtNalogForm.Text := GetReturnValue(sgNalogForm, 3);
        except
          on EConvertError do Exit;
        end;
      end;
  finally
    frmNalogFormShow.Free;
  end;
end;

procedure TfrmRQOrgEdit.spbOrg_typeClick(Sender: TObject);
var
  frmOrg_typesShow: TfrmOrg_typesShow;
begin
  frmOrg_typesShow := TfrmOrg_typesShow.Create(Application, fmNormal);
  try
    with frmOrg_typesShow do
      if ShowModal = mrOk then
      begin
        try
          RQOrgObj.type_ := GetReturnValue(sgOrg_types, 1);
          edtOrg_type.Text := GetReturnValue(sgOrg_types, 2);
        except
          on EConvertError do Exit;
        end;
      end;
  finally
    frmOrg_typesShow.Free;
  end;
end;

procedure TfrmRQOrgEdit.spbOwnershipClick(Sender: TObject);
var
  frmOwnershipShow: TfrmOwnershipShow;
begin
  frmOwnershipShow := TfrmOwnershipShow.Create(Application, fmNormal);
  try
    with frmOwnershipShow do
      if ShowModal = mrOk then
      begin
        try
          RQOrgObj.ownership := StrToInt(GetReturnValue(sgOwnership, 1));
          edtOwnership.Text := GetReturnValue(sgOwnership, 2);
        except
          on EConvertError do Exit;
        end;
      end;
  finally
    frmOwnershipShow.Free;
  end;
end;

procedure TfrmRQOrgEdit.UpdateRSchetList;
var
  i, LastCount: Integer;
  RQOrgRschetBankList: RQOrgRschetShortList;
begin
  ClearGrid(sgRQOrgRschet);

  if DialogState = dsInsert then Exit;
  if RQOrgObj = nil then Exit;
  if RQOrgObj.id = LOW_INT then Exit;

  RQOrgRschetBankList := Self.getRSchetList;

  LastCount := High(RQOrgRschetBankList.list);

  if LastCount > -1 then
     sgRQOrgRschet.RowCount := LastCount + 2
  else
     sgRQOrgRschet.RowCount := 2;

  with sgRQOrgRschet do
    for i := 0 to LastCount do
    begin
      Application.ProcessMessages;

      if RQOrgRschetBankList.list[i].id <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQOrgRschetBankList.list[i].id)
      else
        Cells[0,i+1] := '';
      Cells[1,i+1] := RQOrgRschetBankList.list[i].mfo;
      Cells[2,i+1] := RQOrgRschetBankList.list[i].rschet;
      Cells[3,i+1] := RQOrgRschetBankList.list[i].bankName;
      Cells[4,i+1] := RQOrgRschetBankList.list[i].primechan;
      Cells[5,i+1] := RQOrgRschetBankList.list[i].currency_short_name;
      if RQOrgRschetBankList.list[i].likv_date <> nil then
        Cells[6,i+1] := XSDate2String(RQOrgRschetBankList.list[i].likv_date);
      if RQOrgRschetBankList.list[i].rschet_type = 1 then
        Cells[7,i+1] := 'Транзитный'
      else
        Cells[7,i+1] := 'Собственный';
      Cells[8,i+1] := RQOrgRschetBankList.list[i].rschet_type_name;

      sgRQOrgRschet.RowCount := i + 2;
    end;

   sgRQOrgRschet.Row := 1;
end;

procedure TfrmRQOrgEdit.actConvertToIbanExecute(Sender: TObject);
var
  TempRQOrgRschet : RQOrgRschetControllerSoapPort;
  list : RQOrgRschetShortList;
  i : Integer;
  arrayToConvert : ArrayOfRQOrgRschet;
  orgCodeFK : String;
begin
  inherited;
    if Application.MessageBox(PChar('Ви дійсно бажаєте конвертувати рахунки заданої' +
        ' організації у формат IBAN?'),
                      PChar('Увага!'),MB_ICONQUESTION+MB_YESNO+MB_DEFBUTTON2)=IDNO then
    begin
      Exit;
    end;

    orgCodeFK := RQOrgObj.codeorg;

    TempRQOrgRschet := HTTPRIORQOrgRschet as RQOrgRschetControllerSoapPort;

    list := Self.getRSchetList;

    SetLength(arrayToConvert, list.totalCount);
    for i := 0 to list.totalCount - 1 do begin
      arrayToConvert[i] :=
        RQOrgRschetController.convertRQOrgRschetShortToObject(list.list[i]);
      arrayToConvert[i].orgCodeFK := orgCodeFK;
    end;

    i := TempRQOrgRschet.addOrgRschet(arrayToConvert, true);

    UpdateRSchetList;

    Application.MessageBox(PChar(Format('%d із %d рахунків були переконвертовані ' +
      ' у формат IBAN!'
      , [i, Length(arrayToConvert)]))
      , PChar('Повідомлення'), MB_ICONINFORMATION);



end;

procedure TfrmRQOrgEdit.actENDepartment2OrgDeleteExecute(Sender: TObject);
Var TempENDepartment2Org: ENDepartment2OrgControllerSoapPort;
  ObjCode: Integer;
begin
 TempENDepartment2Org := HTTPRIOENDepartment2Org as ENDepartment2OrgControllerSoapPort;
   try
     ObjCode := StrToInt(sgENDepartment2Org.Cells[0,sgENDepartment2Org.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити підрозділ з організації ?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENDepartment2Org.remove(ObjCode);
      actENDepartment2OrgUpdateExecute(Sender);
	  Application.MessageBox(PChar('Підрозділ з організації видалено')
				, PChar('Повідомлення'), MB_ICONINFORMATION);
  end;
end;

procedure TfrmRQOrgEdit.actENDepartment2OrgInsertExecute(Sender: TObject);
begin
  inherited;
  TfrmENDepartmentShow.chooseFromList(true, procedure(selectedObj : ENDepartmentShort)
  var
    dep2Org : ENDepartment2Org;
	TempENDepartment2Org: ENDepartment2OrgControllerSoapPort;
  begin
			  if not Assigned(RQOrgObj) then Exit;
			  if RQOrgObj.id = Low(Integer) then Exit;
              if Application.MessageBox(PChar(Format('Ви дійсно бажаєте додати підрозділ ''%s'' до організації ''%s'''
                        , [selectedObj.shortName, RQOrgObj.name])),
                              PChar('Внимание !'),MB_ICONQUESTION+MB_YESNO+MB_DEFBUTTON2)=IDYES then begin
        dep2Org := ENDepartment2Org.Create;
				SetNullXSProps(dep2Org);
				SetNullIntProps(dep2Org);
				dep2Org.org_id := RQOrgObj.id;
				dep2Org.departmentRef := ENDepartmentRef.Create;
				dep2Org.departmentRef.code := selectedObj.code;
				TempENDepartment2Org :=  HTTPRIOENDepartment2Org as ENDepartment2OrgControllerSoapPort;
				TempENDepartment2Org.add(dep2Org);
				actENDepartment2OrgUpdateExecute(Sender);
				Application.MessageBox(PChar(Format('Підрозділ ''%s'' додано до організації ''%s''', [selectedObj.shortName, RQOrgObj.name]))
				, PChar('Повідомлення'), MB_ICONINFORMATION);
              end;
  end);
end;

procedure TfrmRQOrgEdit.actENDepartment2OrgUpdateExecute(Sender: TObject);
var
  TempENDepartment2Org: ENDepartment2OrgControllerSoapPort;
  i , LastCount : Integer;
  ENDepartment2OrgList: ENDepartment2OrgShortList;
  filter : ENDepartment2OrgFilter;
begin
  sgENDepartment2Org.Clear;
  SetGridHeaders(ENDepartment2OrgHeaders, sgENDepartment2Org.ColumnHeaders);
  TempENDepartment2Org :=  HTTPRIOENDepartment2Org as ENDepartment2OrgControllerSoapPort;
  filter := ENDepartment2OrgFilter.Create;
  SetNullIntProps(filter);
  SetNullXSProps(filter);

  filter.org_id := RQOrgObj.id;

  ENDepartment2OrgList := TempENDepartment2Org.getScrollableFilteredList(filter,0,-1);

    LastCount:=High(ENDepartment2OrgList.list);

    if LastCount > -1 then
     sgENDepartment2Org.RowCount:=LastCount+2
  else
     sgENDepartment2Org.RowCount:=2;

     with sgENDepartment2Org do
    for i:=0 to High(ENDepartment2OrgList.list) do
      begin
        Application.ProcessMessages;
        if ENDepartment2OrgList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENDepartment2OrgList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENDepartment2OrgList.list[i].departmentRefShortName;

      end;

      sgENDepartment2Org.Row:=1;
end;

procedure TfrmRQOrgEdit.actInsertExecute(Sender: TObject);
begin
  if DialogState = dsInsert then Exit;
  if RQOrgObj = nil then Exit;
  if RQOrgObj.id = LOW_INT then Exit;

  try
    frmRQOrgRschetEdit := TfrmRQOrgRschetEdit.Create(Application, dsInsert);
    try
      frmRQOrgRschetEdit.RQOrgRschetObj := RQOrgRschet.Create;
      SetNullIntProps(frmRQOrgRschetEdit.RQOrgRschetObj);
      SetNullXSProps(frmRQOrgRschetEdit.RQOrgRschetObj);

      {
      if cbContragentType.ItemIndex = 0 then
        frmRQOrgRschetEdit.contrAgentType := AX_CONTRAGENT_TYPE_CUSTOMER
      else if cbContragentType.ItemIndex = 1 then
        frmRQOrgRschetEdit.contrAgentType := AX_CONTRAGENT_TYPE_VENDOR
      else
        raise Exception.Create('Некорректный тип контрагента!');
      }

      frmRQOrgRschetEdit.orgCodeFK := RQOrgObj.codeorg;
      frmRQOrgRschetEdit.orgId := RQOrgObj.id;

      if frmRQOrgRschetEdit.ShowModal = mrOk then
      begin
        if frmRQOrgRschetEdit.RQOrgRschetObj <> nil then
          UpdateRSchetList;
      end;
    finally
      frmRQOrgRschetEdit.Free;
      frmRQOrgRschetEdit := nil;
    end;
  finally
    //RQOrgRschetObj.Free;
  end;
end;

procedure TfrmRQOrgEdit.actRQContactEditExecute(Sender: TObject);
var 
  TempRQContact: RQContactControllerSoapPort;
begin
  TempRQContact := HTTPRIORQContact as RQContactControllerSoapPort;
  try
    RQContactObj := TempRQContact.getObject(StrToInt(sgRQContact.Cells[0,sgRQContact.Row]));
  except
    on EConvertError do Exit;
  end;
  frmRQContactEdit:=TfrmRQContactEdit.Create(Application, dsEdit);
  
  try
    if frmRQContactEdit.ShowModal= mrOk then
      begin
        actRQContactUpdateExecute(Sender);
      end;
  finally
    frmRQContactEdit.Free;
    frmRQContactEdit:=nil;
  end;
  
end;

procedure TfrmRQOrgEdit.actRQContactDeleteExecute(Sender: TObject);
Var TempRQContact: RQContactControllerSoapPort;
  ObjCode: Integer;
begin
 TempRQContact := HTTPRIORQContact as RQContactControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQContact.Cells[0,sgRQContact.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити (Контакт організації) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQContact.remove(ObjCode);
      actRQContactUpdateExecute(Sender);
  end;
end;

procedure TfrmRQOrgEdit.actRQContactInsertExecute(Sender: TObject);
begin
  if RQOrgObj = nil then Exit;
  if RQOrgObj.id = LOW_INT then Exit;


  RQContactObj:=RQContact.Create;
  SetNullIntProps(RQContactObj);
  SetNullXSProps(RQContactObj);

  RQContactObj.org_id := RQOrgObj.id;

  try
    frmRQContactEdit:=TfrmRQContactEdit.Create(Application, dsInsert);
    try
      if frmRQContactEdit.ShowModal = mrOk then
      begin
        if RQContactObj<>nil then
            actRQContactUpdateExecute(Sender);
      end;
    finally
      frmRQContactEdit.Free;
      frmRQContactEdit:=nil;
    end;
  finally
    RQContactObj.Free;
  end;
end;

procedure TfrmRQOrgEdit.actRQContactViewExecute(Sender: TObject);
var 
  TempRQContact: RQContactControllerSoapPort;
begin
  TempRQContact := HTTPRIORQContact as RQContactControllerSoapPort;
  try
    RQContactObj := TempRQContact.getObject(StrToInt(sgRQContact.Cells[0,sgRQContact.Row]));
  except
    on EConvertError do Exit;
  end;
  
  frmRQContactEdit:=TfrmRQContactEdit.Create(Application, dsView);
  
  try
    frmRQContactEdit.ShowModal;
  finally
    frmRQContactEdit.Free;
    frmRQContactEdit:=nil;
  end;  
end;

procedure TfrmRQOrgEdit.actRQContactUpdateExecute(Sender: TObject);
var
  TempRQContact: RQContactControllerSoapPort;
  i, LastCount : Integer;
  RQContactList: RQContactShortList;
  filter : RQContactFilter;
begin
  sgRQContact.Clear;
  SetGridHeaders(RQContactHeaders, sgRQContact.ColumnHeaders);
  TempRQContact :=  HTTPRIORQContact as RQContactControllerSoapPort;
  filter := RQContactFilter.Create;
  SetNullIntProps(filter);
  SetNullXSProps(filter);

  filter.org_id := RQOrgObj.id;
  filter.orderBySQL := 'typerefcode asc, datelostactuality desc, code asc';

  RQContactList := TempRQContact.getScrollableFilteredList(filter,0,-1);

  LastCount:=High(RQContactList.list);

    if LastCount > -1 then
     sgRQContact.RowCount:=LastCount+2
  else
     sgRQContact.RowCount:=2;


     with sgRQContact do
    for i:=0 to High(RQContactList.list) do
      begin
        Application.ProcessMessages;
        if RQContactList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQContactList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := RQContactList.list[i].value;

        Cells[2,i+1] := RQContactList.list[i].typeRefName;

        if RQContactList.list[i].dateLostActuality = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := XSDate2String(RQContactList.list[i].dateLostActuality);

      end;

      sgRQContact.Row:=1;

end;

procedure TfrmRQOrgEdit.actUpdateExecute(Sender: TObject);
begin
  UpdateRSchetList;
end;

procedure TfrmRQOrgEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var
  TempRQOrg: RQOrgControllerSoapPort;
  //isCustomer: Boolean;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
    if not NoBlankValues([
        edtName
        ,edtUkr_name
        ,edtOkpo
        ,edtNalog_num
        //,edtSvidet_num
        ,edtAdr
        ,edtNalogForm
        ,edtOwnership
        ,edtOrg_type
       ])  then
    begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'), PChar('Внимание !'), MB_ICONWARNING + MB_OK);
      Action := caNone;
    end
    else begin
      {
      if cbContragentType.ItemIndex = -1 then
      begin
        Application.MessageBox(PChar('Выберите тип контрагента!'), PChar('Внимание !'), MB_ICONWARNING + MB_OK);
        if cbContragentType.CanFocus then cbContragentType.SetFocus;
        Action := caNone;
        Exit;
      end;
      }

      if chbIs_Plat_NDS.Checked and (edtSvidet_num.Text = '') then
      begin
        Application.MessageBox(PChar('Введите номер свидетельства!'), PChar('Внимание !'), MB_ICONWARNING + MB_OK);
        if edtSvidet_num.CanFocus then edtSvidet_num.SetFocus;
        Action := caNone;
        Exit;
      end;

      if not dtpDate_nalogform.Checked then
      begin
        Application.MessageBox(PChar('Введите дату применения формы налогообложения!'), PChar('Внимание !'), MB_ICONWARNING + MB_OK);
        if dtpDate_nalogform.CanFocus then dtpDate_nalogform.SetFocus;
        Action := caNone;
        Exit;
      end;

      TempRQOrg := HTTPRIORQOrg as RQOrgControllerSoapPort;

       if ( edtId.Text <> '' ) then
         RQOrgObj.id := StrToInt(edtId.Text)
       else
         RQOrgObj.id := Low(Integer) ;

       RQOrgObj.name := edtName.Text;

       RQOrgObj.ukr_name := edtUkr_name.Text;

       RQOrgObj.okpo := edtOkpo.Text;

       RQOrgObj.nalog_num := edtNalog_num.Text;

       RQOrgObj.svidet_num := edtSvidet_num.Text;

       RQOrgObj.adr := edtAdr.Text;
       RQOrgObj.adr_legal := edtAdr_Legal.Text;

       RQOrgObj.tel := edtTel.Text;

       RQOrgObj.country := edtCountry.Text;

       RQOrgObj.region := edtRegion.Text;

       RQOrgObj.ministry := edtMinistry.Text;

       RQOrgObj.Primechan := edtPrimechan.Text;

       ///////////////////////////////////////////////////////////////////////////
       if chbBudget_flag.Checked then
         RQOrgObj.budget_flag := '1'
       else
         RQOrgObj.budget_flag := '0';

       if dtpDate_nalogform.Checked then
       begin
         if RQOrgObj.date_nalogform = nil then
           RQOrgObj.date_nalogform := TXSDate.Create;
         RQOrgObj.date_nalogform.XSToNative(GetXSDate(dtpDate_nalogform.DateTime));
       end
       else
         RQOrgObj.date_nalogform := nil;

       if chbPerson_type.Checked then
         RQOrgObj.person_type := 1
       else
         RQOrgObj.person_type := 0;

       if chbIs_Plat_NDS.Checked then
         RQOrgObj.is_plat_nds := 1
       else
         RQOrgObj.is_plat_nds := 0;

       if dtpDate_svidet.Checked then
       begin
         if RQOrgObj.date_svidet = nil then
           RQOrgObj.date_svidet := TXSDate.Create;
         RQOrgObj.date_svidet.XSToNative(GetXSDate(dtpDate_svidet.DateTime));
       end
       else
         RQOrgObj.date_svidet := nil;

       if chbExcept_flag.Checked then
         RQOrgObj.except_flag := '1';

       try
         if edtNalog_code_filial.Text <> '' then
           RQOrgObj.nalog_code_filial := StrToInt(edtNalog_code_filial.Text);
       except
         on EConvertError do
           raise Exception.Create('Некорректный налоговый код филиала!');
       end;
       ///////////////////////////////////////////////////////////////////////////

      {
      if cbContragentType.ItemIndex = 0 then
        isCustomer := true
      else if cbContragentType.ItemIndex = 1 then
        isCustomer := false
      else
        raise Exception.Create('Некорректный тип контрагента!');
      }

      if DialogState = dsInsert then
      begin
        RQOrgObj.code := Low(Integer);
        //TempRQOrg.add(RQOrgObj);
        //TempRQOrg.addOrg(RQOrgObj, isCustomer);
        RQOrgObj.codeorg := TempRQOrg.addOrg(RQOrgObj);
      end
      else
      if DialogState = dsEdit then
      begin
        //TempRQOrg.save(RQOrgObj);
      end;

    end;
end;


end.
