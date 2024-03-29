
unit ShowENServicesRent;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs,
  ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns,
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENServicesObjectController, AdvObj, tmsAdvGridExcel;


type
  TfrmENServicesRentShow = class(TChildForm)
  HTTPRIOENServicesObject: THTTPRIO;
    ImageList1: TImageList;
    sgENServicesObject: TAdvStringGrid;
    ActionList1: TActionList;
    actView: TAction;
    actInsert: TAction;
    actDelete: TAction;
    actEdit: TAction;
    actUpdate: TAction;
    actFilter: TAction;
    actNoFilter: TAction;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton11: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    N5: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    actBudgetApproved: TAction;
    actUnBudgetApproved: TAction;
    actSigned: TAction;
    actUnSigned: TAction;
    actPaid: TAction;
    actUnPaid: TAction;
    actCanceled: TAction;
    N16: TMenuItem;
    actExpExcel: TAction;
    N17: TMenuItem;
    actCountersActSigned: TAction;
    actCountersActUnSigned: TAction;
    actFinishWork: TAction;
    actPrepaid: TAction;
    actUnPrepaid: TAction;
    actDisclaimerCustomerServices: TAction;
    HTTPRIOENFamilySize2ServicesObject: THTTPRIO;
    mniAproveCalc: TMenuItem;
    N9: TMenuItem;
    aeExcel: TAdvGridExcelIO;

procedure FormShow(Sender: TObject);
procedure FormClose(Sender: TObject; var Action: TCloseAction);
procedure sgENServicesObjectTopLeftChanged(Sender: TObject);
procedure sgENServicesObjectDblClick(Sender: TObject);
procedure actViewExecute(Sender: TObject);
procedure actEditExecute(Sender: TObject);
procedure actDeleteExecute(Sender: TObject);
procedure actInsertExecute(Sender: TObject);
procedure actUpdateExecute(Sender: TObject);
procedure actFilterExecute(Sender: TObject);
procedure actNoFilterExecute(Sender: TObject);
    procedure actBudgetApprovedExecute(Sender: TObject);
    procedure actUnBudgetApprovedExecute(Sender: TObject);
    procedure actSignedExecute(Sender: TObject);
    procedure actUnSignedExecute(Sender: TObject);
    procedure actPaidExecute(Sender: TObject);
    procedure actUnPaidExecute(Sender: TObject);
    procedure actCanceledExecute(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure actExpExcelExecute(Sender: TObject);
    procedure actCountersActSignedExecute(Sender: TObject);
    procedure actCountersActUnSignedExecute(Sender: TObject);
    procedure actFinishWorkExecute(Sender: TObject);
    procedure actPrepaidExecute(Sender: TObject);
    procedure actUnPrepaidExecute(Sender: TObject);
    procedure actDisclaimerCustomerServicesExecute(Sender: TObject);
    function checkFamilySize2ServicesObject(servicesObjCode: Integer) : Boolean;

  private
   { Private declarations }
   isFiltered  : boolean;
   rent : Boolean;

 public
   { Public declarations }
   procedure UpdateGrid(Sender: TObject);
 end;

var
 // ENServicesRentObj: ENServicesObject;
 // ENServicesObjectFilterObj: ENServicesObjectFilter;
 frmENServicesRentShow : TfrmENServicesRentShow;

var servObjCode: Integer;

implementation

uses Main, EditENServicesObjectFilter,
  EditENServicesRent, DMReportsUnit, ENConsts,
  ENServicesContractKindController, ENServicesContractTypeController,
  ENFamilySize2ServicesObjectController, Globals ,ShellAPI;



{$R *.dfm}

var
  //frmENServicesCalculObjectShow : TfrmENServicesCalculObjectShow;


  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENServicesCalculationHeaders: array [1..15] of String =
        ( '���'
          ,'���������� � ���.'
          ,'���� ���.(����������)'
          ,'� ���. ���.���.'
          ,'���� ���. ���.���.'
          ,'��������'
          ,'��� ���������'
          ,'���� ������'
          ,'������ ����'
          ,'��� ��������'
          ,'������ ��������'
          ,'���. ������'
          ,'��������� ��������'
          ,'��������� �����'
          ,'������ ���������'
          {,'������������ ������� ���������'
          ,'���� ���������� ���������'}
        );
   

procedure TfrmENServicesRentShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (FormMode = fmChild) then
  begin
    {
    if (FilterObject <> nil) then
    begin
      if (ENServicesObjectFilter(FilterObject).contractTypeRef <> nil)
          and (ENServicesObjectFilter(FilterObject).contractTypeRef.code = ENSERVICESOBJECTTYPE_OKSN)
      then frmENServicesRentShow := nil
      else
        frmENServicesCalculationShow := nil;
    end
    else
      frmENServicesCalculationShow := nil;
    }
    frmENServicesRentShow := nil;
  end;

   inherited;
end;


procedure TfrmENServicesRentShow.FormShow(Sender: TObject);
var
  TempENServicesObject: ENServicesObjectControllerSoapPort;
  i: Integer;
  ENServicesObjectList: ENServicesObjectShortList;
begin
  if (FilterObject <> nil) and (ENServicesObjectFilter(FilterObject).contractTypeRef <> nil) and
     (ENServicesObjectFilter(FilterObject).contractTypeRef.code = ENSERVICESOBJECTTYPE_OKSN) then
  begin
    rent := True;
    ENServicesObjectFilter(FilterObject).orderBySQL := 'dateedit desc, code desc';
  end;

  DisableActions([actNoFilter]);
  SetGridHeaders(ENServicesCalculationHeaders, sgENServicesObject.ColumnHeaders);

  if (rent) then
  begin
    sgENServicesObject.ColWidths[9] := 150;
    sgENServicesObject.ColumnHeaders[9] := '��� ��������';
  end;

  ColCount:=100;
  TempENServicesObject :=  HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENServicesObjectFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
     //ENServicesObjectFilter(FilterObject).conditionSQL := 'contractnumberservices is not null';
     ENServicesObjectFilter(FilterObject).conditionSQL := '(contractnumberservices is not null and ' +
                                                          ' coalesce(contracttyperefcode, -1) <> ' + IntToStr(ENSERVICESOBJECTTYPE_OKSN) + ')';
     ENServicesObjectFilter(FilterObject).orderBySQL := 'dateedit desc, code desc';

     isFiltered := false;
  end
  else
     isFiltered := true;

  if not isFiltered then
  begin
     actFilterExecute(Sender);
     exit;
  end;

  ENServicesObjectList := TempENServicesObject.getEasyShortList(ENServicesObjectFilter(FilterObject),0,ColCount);
  LastCount:=High(ENServicesObjectList.list);

  if LastCount > -1 then
     sgENServicesObject.RowCount:=LastCount+2
  else
     sgENServicesObject.RowCount:=2;

   with sgENServicesObject do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENServicesObjectList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENServicesObjectList.list[i].code)
        else
        Cells[0,i+1] := '';

        Cells[1,i+1] := ENServicesObjectList.list[i].contractNumberServices;
        if ENServicesObjectList.list[i].contractDateServices = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDate2String(ENServicesObjectList.list[i].contractDateServices);

        if ENServicesObjectList.list[i].finDocID <> Low(Integer) then
          Cells[3,i+1] := ENServicesObjectList.list[i].contractNumber
        else
          Cells[3,i+1] := '';

        if ENServicesObjectList.list[i].finDocID <> Low(Integer) then
        if ENServicesObjectList.list[i].contractDate = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := XSDate2String(ENServicesObjectList.list[i].contractDate);

        Cells[5,i+1] := ENServicesObjectList.list[i].contragentname;
        Cells[6,i+1] := ENServicesObjectList.list[i].contragentokpo;

        // ����� ������
        if ( ENServicesObjectList.list[i].paySum <> nil ) then
        Cells[7,i+1] := ENServicesObjectList.list[i].paySum.DecimalString
        else
        Cells[7,i+1] := '';

        // ������������ ��������� �����
        Cells[8,i+1] := ENServicesObjectList.list[i].actnames;
        // ����� ��������
        Cells[9,i+1] := ENServicesObjectList.list[i].contractKindRefName;
        // ������ ��������
        Cells[10,i+1] := ENServicesObjectList.list[i].contractStatusRefName;

        // ���. ������
        Cells[11,i+1] := ENServicesObjectList.list[i].statusRefName;

        // ������� ��������
        Cells[12,i+1] := ENServicesObjectList.list[i].prov_exist;

        // ���������� �����
        Cells[13,i+1] := ENServicesObjectList.list[i].citiesList;

        Cells[14,i+1] := ENServicesObjectList.list[i].contragentAddress;

        LastRow:=i+1;
        sgENServicesObject.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENServicesObject.Row:=1;
end;


procedure TfrmENServicesRentShow.sgENServicesObjectTopLeftChanged(Sender: TObject);
var
  TempENServicesObject: ENServicesObjectControllerSoapPort;
  i,CurrentRow: Integer;
  ENServicesObjectList: ENServicesObjectShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENServicesObject.TopRow + sgENServicesObject.VisibleRowCount) = ColCount
  then
    begin
      TempENServicesObject :=  HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
      CurrentRow:=sgENServicesObject.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENServicesObjectFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
     ENServicesObjectFilter(FilterObject).conditionSQL := 'contractnumberservices is not null';
     ENServicesObjectFilter(FilterObject).orderBySQL := 'dateedit desc, code desc';
  end;

  ENServicesObjectList := TempENServicesObject.getEasyShortList(ENServicesObjectFilter(FilterObject),ColCount-1, 100);
  sgENServicesObject.RowCount:=sgENServicesObject.RowCount+100;

  LastCount:=High(ENServicesObjectList.list);
  with sgENServicesObject do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENServicesObjectList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENServicesObjectList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';

        Cells[1,i+CurrentRow] := ENServicesObjectList.list[i].contractNumberServices;

        if ENServicesObjectList.list[i].contractDateServices = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := XSDate2String(ENServicesObjectList.list[i].contractDateServices);

          
        if ENServicesObjectList.list[i].finDocID <> Low(Integer) then
          Cells[3,i+CurrentRow] := ENServicesObjectList.list[i].contractNumber
        else
          Cells[3,i+CurrentRow] := '';

        if ENServicesObjectList.list[i].finDocID <> Low(Integer) then
        if ENServicesObjectList.list[i].contractDate = nil then
          Cells[4,i+CurrentRow] := ''
        else
          Cells[4,i+CurrentRow] := XSDate2String(ENServicesObjectList.list[i].contractDate);

        {
        /// 21.09.11 ����� �������� ���� ����, � �� � �� (���� ����� ���, ����� � ��)!
        if ENServicesObjectList.list[i].contractDateServices = nil then
        begin
          if ENServicesObjectList.list[i].contractDate = nil then
            Cells[2,i+CurrentRow] := ''
          else
            Cells[2,i+CurrentRow] := XSDate2String(ENServicesObjectList.list[i].contractDate);
        end
        else
          Cells[2,i+CurrentRow] := XSDate2String(ENServicesObjectList.list[i].contractDateServices);
        ///
        }

        Cells[5,i+CurrentRow] := ENServicesObjectList.list[i].contragentname;
        Cells[6,i+CurrentRow] := ENServicesObjectList.list[i].contragentokpo;
        // ����� ������
        if ( ENServicesObjectList.list[i].paySum <> nil ) then
        Cells[7,i+CurrentRow] := ENServicesObjectList.list[i].paySum.DecimalString
        else
        Cells[7,i+CurrentRow] := '';
        // ������������ ��������� �����
        Cells[8,i+CurrentRow] := ENServicesObjectList.list[i].actnames;
        // ����� ��������
        Cells[9,i+CurrentRow] := ENServicesObjectList.list[i].contractKindRefName;
        // ������ ��������
        Cells[10,i+CurrentRow] := ENServicesObjectList.list[i].contractStatusRefName;

        // ���. ������
        Cells[11,i+CurrentRow] := ENServicesObjectList.list[i].statusRefName;

        // ������� ��������
        Cells[12,i+CurrentRow] := ENServicesObjectList.list[i].prov_exist;

        // ���������� �����
        Cells[13,i+CurrentRow] := ENServicesObjectList.list[i].citiesList;

        Cells[14,i+CurrentRow] := ENServicesObjectList.list[i].contragentAddress;

        LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENServicesObject.Row:=CurrentRow-5;
   sgENServicesObject.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENServicesRentShow.sgENServicesObjectDblClick(Sender: TObject);
begin
  if (FormMode = fmNormal) or (FormMode = fmFiltered) then
  begin
    try
      servObjCode := StrToInt(GetReturnValue(sgENServicesObject, 0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENServicesRentShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENServicesObject.RowCount-1 do
   for j:=0 to sgENServicesObject.ColCount-1 do
     sgENServicesObject.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENServicesRentShow.actViewExecute(Sender: TObject);
Var TempENServicesCalculation: ENServicesObjectControllerSoapPort;
begin
 TempENServicesCalculation := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
   try
     ENServicesRentObj := TempENServicesCalculation.getObject(StrToInt(sgENServicesObject.Cells[0,sgENServicesObject.Row]));
   except
   on EConvertError do Exit;
  end;

  frmENServicesRentEdit := TfrmENServicesRentEdit.Create(Application, dsView);
  if (rent)
    then frmENServicesRentEdit.rent := True;

  frmENServicesRentEdit.edtStatus.Text := sgENServicesObject.Cells[10,sgENServicesObject.Row];
  try
    frmENServicesRentEdit.ShowModal;
  finally
    frmENServicesRentEdit.Free;
    frmENServicesRentEdit:=nil;
  end;
end;

procedure TfrmENServicesRentShow.actEditExecute(Sender: TObject);
Var TempENServicesCalculation: ENServicesObjectControllerSoapPort;
begin
  TempENServicesCalculation := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
  try
    ENServicesRentObj := TempENServicesCalculation.getObject(StrToInt(sgENServicesObject.Cells[0,sgENServicesObject.Row]));
  except
    on EConvertError do Exit;
  end;

  if (ENServicesRentObj.statusRef.code = ENSERVICESOBJECT_FINSTATUS_CLOSED) then
  begin
    Application.MessageBox(PChar('��������, ��������� � ��, ���������� �� �����!'), PChar('�����!'), MB_ICONWARNING);
    Exit;
  end;

  if (ENServicesRentObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_SIGNED) or
     (ENServicesRentObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_PREPAID) or
     (ENServicesRentObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_PAID) then
  begin
    Application.MessageBox(PChar('�������� � �������� "ϳ��������" ��� "���������" ���������� �� �����!'), PChar('�����!'), MB_ICONWARNING);
    Exit;
  end;

  if (ENServicesRentObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_CANCELED) then
  begin
    Application.MessageBox(PChar('�������� � �������� "³�������" ���������� �� �����!'), PChar('�����!'), MB_ICONWARNING);
    Exit;
  end;

  if (ENServicesRentObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_COMPLETED) then
  begin
    Application.MessageBox(PChar('�������� � �������� "������ ��������" ���������� �� �����!'), PChar('�����!'), MB_ICONWARNING);
    Exit;
  end;

  if (ENServicesRentObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_TERMINATED) then
  begin
    Application.MessageBox(PChar('�������� � �������� "����������" ���������� �� �����!'), PChar('�����!'), MB_ICONWARNING);
    Exit;
  end;

  if (ENServicesRentObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_DISCLAIMER) then
  begin
    Application.MessageBox(PChar('�������� � �������� "³����� ��������� �� ������" ���������� �� �����!'), PChar('�����!'), MB_ICONWARNING);
    Exit;
  end;

  frmENServicesRentEdit:=TfrmENServicesRentEdit.Create(Application, dsEdit);
  if (rent)
     then frmENServicesRentEdit.rent := True;

  try
    frmENServicesRentEdit.edtStatus.Text := sgENServicesObject.Cells[10,sgENServicesObject.Row];
    if frmENServicesRentEdit.ShowModal= mrOk then
      begin

        UpdateGrid(Sender);
      end;
    //UpdateGrid(Sender);
  finally
    frmENServicesRentEdit.Free;
    frmENServicesRentEdit:=nil;
  end;
end;

procedure TfrmENServicesRentShow.actDeleteExecute(Sender: TObject);
Var TempENServicesCalculation: ENServicesObjectControllerSoapPort;
    ObjCode: Integer;
begin
  TempENServicesCalculation := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;

  try
    ObjCode := StrToInt(sgENServicesObject.Cells[0,sgENServicesObject.Row]);
  except
    on EConvertError do Exit;
  end;

  ENServicesRentObj := TempENServicesCalculation.getObject(ObjCode);

  if (ENServicesRentObj.statusRef.code = ENSERVICESOBJECT_FINSTATUS_CLOSED) then
  begin
    Application.MessageBox(PChar('��������, ��������� � ��, �������� �� �����!'), PChar('�����!'), MB_ICONWARNING);
    Exit;
  end;

  if (ENServicesRentObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_SIGNED) or
     (ENServicesRentObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_PAID) then
  begin
    Application.MessageBox(PChar('�������� � �������� "ϳ��������" ��� "���������" �������� �� �����!'), PChar('�����!'), MB_ICONWARNING);
    Exit;
  end;

  if Application.MessageBox(PChar('�� ����� ������ �������� (��''���� - ������� �� �������) ?'),
                            PChar('�����!'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
  begin
      TempENServicesCalculation.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;


procedure TfrmENServicesRentShow.actInsertExecute(Sender: TObject);
begin
  ENServicesRentObj := ENServicesObject.Create;
  SetNullIntProps(ENServicesRentObj);
  SetNullXSProps(ENServicesRentObj);

  // ENServicesRentObj.contractDate:= TXSDate.Create;
  // ENServicesRentObj.dateEdit:= TXSDate.Create;

  try
    frmENServicesRentEdit := TfrmENServicesRentEdit.Create(Application, dsInsert);
    if (rent)
      then frmENServicesRentEdit.rent := True;

    try
      if frmENServicesRentEdit.ShowModal = mrOk then
      begin
        if ENServicesRentObj<>nil then
        begin
            //TempENServicesObject.add(ENServicesRentObj);
            UpdateGrid(Sender);
        end;
      end;
    finally
      frmENServicesRentEdit.Free;
      frmENServicesRentEdit:=nil;
    end;
  finally
    ENServicesRentObj.Free;
  end;
end;

procedure TfrmENServicesRentShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENServicesRentShow.actFilterExecute(Sender: TObject);
var
    contractKindCode{, contractTypeCode }: Integer;
    conditionSQL : String;
begin
  contractKindCode := -1;
  //contractTypeCode := -1;
  
  frmENServicesObjectFilterEdit := TfrmENServicesObjectFilterEdit.Create(Application, dsInsert);
  try
    frmENServicesObjectFilterEdit.rent := rent;

    ENServicesObjectFilterObj := ENServicesObjectFilter.Create;
    SetNullIntProps(ENServicesObjectFilterObj);
    SetNullXSProps(ENServicesObjectFilterObj);

    if FilterObject <> nil then
    begin
      if ENServicesObjectFilter(FilterObject).contractKindRef <> nil then
         contractKindCode := ENServicesObjectFilter(FilterObject).contractKindRef.code;
    end;

    if frmENServicesObjectFilterEdit.ShowModal = mrOk then
    begin

      if rent then
      begin
        ENServicesObjectFilterObj.contractTypeRef := ENServicesContractTypeRef.Create;
        ENServicesObjectFilterObj.contractTypeRef.code := ENSERVICESOBJECTTYPE_OKSN;
      end;

      if (contractKindCode <> -1) then
      begin
        ENServicesObjectFilterObj.contractKindRef := ENServicesContractKindRef.Create;
        ENServicesObjectFilterObj.contractKindRef.code := contractKindCode;
      end;

      //FilterObject := ENServicesObjectFilter.Create;
      FilterObject := ENServicesObjectFilterObj;
      conditionSQL := ENServicesObjectFilter(FilterObject).conditionSQL;
      AddCondition(conditionSQL, 'contractnumberservices is not null');

      if not rent then
        AddCondition(conditionSQL, 'coalesce(contracttyperefcode, -1) <> ' + IntToStr(ENSERVICESOBJECTTYPE_OKSN));

      ENServicesObjectFilter(FilterObject).conditionSQL := conditionSQL;
      ENServicesObjectFilter(FilterObject).orderBySQL := 'dateedit desc, code desc';
      actUpdateExecute(Sender);
    end;
  finally
    frmENServicesObjectFilterEdit.Free;
    frmENServicesObjectFilterEdit:=nil;
  end;
end;


procedure TfrmENServicesRentShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

procedure TfrmENServicesRentShow.actBudgetApprovedExecute(
  Sender: TObject);
var TempENServicesObject : ENServicesObjectControllerSoapPort;
    objCode, planCode : Integer;
    svoObject : ENServicesObject;
begin
    TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;

  try
    objCode := StrToInt(sgENServicesObject.Cells[0,sgENServicesObject.Row]);
    svoObject := TempENServicesObject.getObject(objCode);
    planCode := DMReports.getPlanCodeForCalculationByElement(svoObject.element.code);
  except
    on EConvertError do Exit;
  end;

  if Application.MessageBox(PChar('�� ����� ������ ���������� �������� ?'),
                    PChar('����� !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempENServicesObject.budgetApproved(objCode, planCode);

    Application.MessageBox(PChar('�������� ����������� ...'), PChar('�����������'), MB_ICONINFORMATION);
    UpdateGrid(Sender);
  end;
end;


procedure TfrmENServicesRentShow.actUnBudgetApprovedExecute(
  Sender: TObject);
var TempENServicesObject : ENServicesObjectControllerSoapPort;
    objCode : Integer;
begin

  try
    objCode := StrToInt(sgENServicesObject.Cells[0,sgENServicesObject.Row]);
  except
    on EConvertError do Exit;
  end;

  if Application.MessageBox(PChar('�� ����� ������ ������� ������������ ��������� ?'),
                    PChar('����� !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
    TempENServicesObject.unBudgetApproved(objCode);

    Application.MessageBox(PChar('������������ �������...'), PChar('�����������'), MB_ICONINFORMATION);
    UpdateGrid(Sender);
  end;
end;



procedure TfrmENServicesRentShow.actSignedExecute(Sender: TObject);
var TempENServicesObject : ENServicesObjectControllerSoapPort;
    objCode : Integer;
    servicesObject : ENServicesObject;
begin
  try
    objCode := StrToInt(sgENServicesObject.Cells[0,sgENServicesObject.Row]);
  except
    on EConvertError do Exit;
  end;

  TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
  servicesObject := TempENServicesObject.getObject(objCode);

  if (servicesObject.finDocID = LOW_INT) then
  begin
    Application.MessageBox(PChar('�� ������� ������ � Գ�. ��������!!!'),PChar('����� !'),MB_ICONWARNING+MB_OK);
    actEditExecute(Sender);
    Exit;
  end;

  if (servicesObject.contragentName = '') then
  begin
    Application.MessageBox(PChar('�� ������� ��������� � �������!!!'),PChar('����� !'),MB_ICONWARNING+MB_OK);
    actEditExecute(Sender);
    Exit;
  end;

  // ��� ����� ��������� ���������� ��������� - ������������ ���� (��� ��. ��� ��������)!
  if (servicesObject.calcTypeRef.code = ENSERVICESOBJECT_CALCTYPE_BY_FACT) then
  begin
    if (servicesObject.contragentTypeRef.code = ENSERVICESOBJECT_CONTRAGENTTYPE_JURIDICAL_NONBUDGET) then
      if (servicesObject.contragentBankName = '') or
         (servicesObject.contragentBankAccount = '') or
         (servicesObject.contragentBankMfo = '') then
      begin
        Application.MessageBox(PChar('������ �������� �������� ���������!'),PChar('����� !'),MB_ICONWARNING+MB_OK);
        actEditExecute(Sender);
        Exit;
      end;
  end;

  if Application.MessageBox(PChar('�� ����� ������ �������� ������?'),
                    PChar('����� !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin

    TempENServicesObject.signed(objCode);

    Application.MessageBox(PChar('������ ��������...'), PChar('�����������'), MB_ICONINFORMATION);
    UpdateGrid(Sender);
  end;
end;

procedure TfrmENServicesRentShow.actUnSignedExecute(
  Sender: TObject);
var TempENServicesObject : ENServicesObjectControllerSoapPort;
    objCode : Integer;
begin

  try
    objCode := StrToInt(sgENServicesObject.Cells[0,sgENServicesObject.Row]);
  except
    on EConvertError do Exit;
  end;

  if Application.MessageBox(PChar('�� ����� ������ ������� ��������� ��������?'),
                    PChar('����� !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;

    TempENServicesObject.unSigned(objCode);

    Application.MessageBox(PChar('ϳ�������� �������...'), PChar('�����������'), MB_ICONINFORMATION);
    UpdateGrid(Sender);
  end;
end;

procedure TfrmENServicesRentShow.actPaidExecute(Sender: TObject);
var TempENServicesObject : ENServicesObjectControllerSoapPort;
    objCode : Integer;
begin

  try
    objCode := StrToInt(sgENServicesObject.Cells[0,sgENServicesObject.Row]);
  except
    on EConvertError do Exit;
  end;

  if Application.MessageBox(PChar('�� ����� ������ �������� ������� �� ���������?'),
                    PChar('����� !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;

    TempENServicesObject.paid(objCode);

    Application.MessageBox(PChar('������� ��������...'), PChar('�����������'), MB_ICONINFORMATION);
    UpdateGrid(Sender);
  end;
end;

procedure TfrmENServicesRentShow.actUnPaidExecute(Sender: TObject);
var TempENServicesObject : ENServicesObjectControllerSoapPort;
    objCode : Integer;
begin

  try
    objCode := StrToInt(sgENServicesObject.Cells[0,sgENServicesObject.Row]);
  except
    on EConvertError do Exit;
  end;

  if Application.MessageBox(PChar('�� ����� ������ ������� ������?'),
                    PChar('����� !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;

    TempENServicesObject.unPaid(objCode);

    Application.MessageBox(PChar('������ �������...'), PChar('�����������'), MB_ICONINFORMATION);
    UpdateGrid(Sender);
  end;
end;

procedure TfrmENServicesRentShow.actCanceledExecute(
  Sender: TObject);
var TempENServicesObject : ENServicesObjectControllerSoapPort;
    objCode : Integer;
begin

  try
    objCode := StrToInt(sgENServicesObject.Cells[0,sgENServicesObject.Row]);
  except
    on EConvertError do Exit;
  end;

  if Application.MessageBox(PChar('�� ����� ������ ������� ������?'),
                    PChar('����� !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;

    TempENServicesObject.canceled(objCode);

    Application.MessageBox(PChar('������ �������...'), PChar('�����������'), MB_ICONINFORMATION);
    UpdateGrid(Sender);
  end;
end;


procedure TfrmENServicesRentShow.PopupMenu1Popup(Sender: TObject);
var
  calc : ENServicesObject;
  ObjCode : Integer;
begin
   try
     ObjCode := StrToInt(sgENServicesObject.Cells[0,sgENServicesObject.Row]);
   except
     on EConvertError do Exit;
   end;

   calc := DMReports.getServicesObjectByCode(ObjCode);
   if calc = nil then
   begin
     Exit;
   end;


   // SUPP - 3740... +++ ����� ��������� �� ����� - ���� �� �������� � �� � �� �������������!!!
   actDisclaimerCustomerServices.Enabled :=
      ((calc.contractStatusRef.code <> ENSERVICESOBJECTSTATUS_DISCLAIMER) and (calc.statusRef.code = ENSERVICESOBJECT_FINSTATUS_GOOD)
          and (calc.contractTypeRef.code <> ENSERVICESOBJECTTYPE_CONNECTION));

   actCanceled.Enabled := calc.contractStatusRef.code = ENSERVICESOBJECTSTATUS_DRAFT;
   actBudgetApproved.Enabled := calc.contractStatusRef.code = ENSERVICESOBJECTSTATUS_DRAFT;
   actUnBudgetApproved.Enabled := calc.contractStatusRef.code = ENSERVICESOBJECTSTATUS_BUDGETAPPROVED;
   actSigned.Enabled := calc.contractStatusRef.code = ENSERVICESOBJECTSTATUS_BUDGETAPPROVED;
   actUnSigned.Enabled := calc.contractStatusRef.code = ENSERVICESOBJECTSTATUS_SIGNED;

   if calc.calcTypeRef.code = ENSERVICESOBJECT_CALCTYPE_BY_CALCULATION then
   begin
     HideActions([actPrepaid, actUnPrepaid, actFinishWork]);
     actPaid.Caption := '�������� �������';
     actUnPaid.Caption := '³������ ������ �������';

     actPaid.Enabled := calc.contractStatusRef.code = ENSERVICESOBJECTSTATUS_SIGNED;
     actUnPaid.Enabled := calc.contractStatusRef.code = ENSERVICESOBJECTSTATUS_PAID;

     actCountersActSigned.Enabled := calc.contractStatusRef.code = ENSERVICESOBJECTSTATUS_PAID;
     actCountersActUnSigned.Enabled := calc.contractStatusRef.code = ENSERVICESOBJECTSTATUS_ACT_SIGNED;
   end
   else if calc.calcTypeRef.code = ENSERVICESOBJECT_CALCTYPE_BY_FACT then
   begin
     HideActions([actPrepaid, actUnPrepaid, actFinishWork], false);
     actPaid.Caption := '�������� ���������� �������';
     actUnPaid.Caption := '³������ ������ ����������� �������';

     ///// 14.05.13 NET-4235
     //actPaid.Enabled := calc.contractStatusRef.code = ENSERVICESOBJECTSTATUS_SIGNED;
     actPrepaid.Enabled := calc.contractStatusRef.code = ENSERVICESOBJECTSTATUS_SIGNED;
     actUnPrepaid.Enabled := calc.contractStatusRef.code = ENSERVICESOBJECTSTATUS_PREPAID;

     //actFinishWork.Enabled := (calc.contractStatusRef.code = ENSERVICESOBJECTSTATUS_PREPAID) and
     //                         (calc.statusRef.code <> ENSERVICESOBJECT_FINSTATUS_CLOSED);

     // ���� ��� ��. ���� ������, �� ������ ����� ���� ���������, �� ��������� ������, ����� - ����� "������"
     if calc.contragentTypeRef.code = ENSERVICESOBJECT_CONTRAGENTTYPE_JURIDICAL_BUDGET then
       actFinishWork.Enabled := ((calc.contractStatusRef.code = ENSERVICESOBJECTSTATUS_SIGNED) or
                                 (calc.contractStatusRef.code = ENSERVICESOBJECTSTATUS_PREPAID)) and
                                (calc.statusRef.code <> ENSERVICESOBJECT_FINSTATUS_CLOSED)
     else
       actFinishWork.Enabled := (calc.contractStatusRef.code = ENSERVICESOBJECTSTATUS_PREPAID) and
                                (calc.statusRef.code <> ENSERVICESOBJECT_FINSTATUS_CLOSED);

     actPaid.Enabled := calc.contractStatusRef.code = ENSERVICESOBJECTSTATUS_COMPLETED;
     /////
   
     actUnPaid.Enabled := calc.contractStatusRef.code = ENSERVICESOBJECTSTATUS_PAID;

     actCountersActSigned.Enabled := calc.contractStatusRef.code = ENSERVICESOBJECTSTATUS_PREPAID; //ENSERVICESOBJECTSTATUS_PAID;
     actCountersActUnSigned.Enabled := calc.contractStatusRef.code = ENSERVICESOBJECTSTATUS_ACT_SIGNED;
  end
  else
    raise Exception.Create('NET-4235 �������� ��� ���������� ��� ��������! ��� ��������: ' + IntToStr(ObjCode));
end;


procedure TfrmENServicesRentShow.actExpExcelExecute(
  Sender: TObject);
var AppPath, FileName: String;
    OldCursor: TCursor;
begin


  OldCursor := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;

    AppPath := ExtractFilePath(Application.ExeName);
    if not DirectoryExists(AppPath + TempReportsPath) then
      CreateDir(AppPath + TempReportsPath);
    FileName := AppPath + TempReportsPath + GetFileName('������ ��������_') + '.xls';

    aeExcel.XLSExport(FileName);
    ShellExecute(0,
                 PChar('open'),
                 PChar('"' + FileName + '"'),
                 nil,
                 nil,
                 SW_SHOWMAXIMIZED);
  finally
    Screen.Cursor := OldCursor;
  end;
end;

procedure TfrmENServicesRentShow.actCountersActSignedExecute(
  Sender: TObject);
var TempENServicesObject : ENServicesObjectControllerSoapPort;
    objCode : Integer;
begin

  try
    objCode := StrToInt(sgENServicesObject.Cells[0,sgENServicesObject.Row]);
  except
    on EConvertError do Exit;
  end;

  if Application.MessageBox(PChar('�� ����� ������ �������� ��� ������� ���������?'),
                    PChar('����� !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;

    TempENServicesObject.actSigned(objCode);

    Application.MessageBox(PChar('��� ��������...'), PChar('�����������'), MB_ICONINFORMATION);
    UpdateGrid(Sender);
  end;
end;

procedure TfrmENServicesRentShow.actCountersActUnSignedExecute(
  Sender: TObject);
var TempENServicesObject : ENServicesObjectControllerSoapPort;
    objCode : Integer;
begin

  try
    objCode := StrToInt(sgENServicesObject.Cells[0,sgENServicesObject.Row]);
  except
    on EConvertError do Exit;
  end;

  if Application.MessageBox(PChar('�� ����� ������ ������� ��������� ����?'),
                    PChar('����� !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;

    TempENServicesObject.actUnSigned(objCode);

    Application.MessageBox(PChar('ϳ�������� ���� �������...'), PChar('�����������'), MB_ICONINFORMATION);
    UpdateGrid(Sender);
  end;
end;


procedure TfrmENServicesRentShow.actFinishWorkExecute(
  Sender: TObject);
var TempENServicesObject: ENServicesObjectControllerSoapPort;
    objCode: Integer;
    servicesObject: ENServicesObject;
begin
  try
    objCode := StrToInt(sgENServicesObject.Cells[0, sgENServicesObject.Row]);
  except
    on EConvertError do Exit;
  end;

  TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
  servicesObject := TempENServicesObject.getObject(objCode);

  {
  if (servicesObject.finDocID = LOW_INT) then
  begin
    Application.MessageBox(PChar('�� ������� ������ � Գ�. ��������!!!'),PChar('����� !'),MB_ICONWARNING+MB_OK);
    actEditExecute(Sender);
    Exit;
  end;

  if (servicesObject.contragentName = '') then
  begin
    Application.MessageBox(PChar('�� ������� ��������� � �������!!!'),PChar('����� !'),MB_ICONWARNING+MB_OK);
    actEditExecute(Sender);
    Exit;
  end;
  }

  if Application.MessageBox(PChar('�� ����� ������ ��������� ������ � ������ "������ ��������"?'),
                            PChar('����� !'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
  begin
    TempENServicesObject.finishWorks(objCode);
    Application.MessageBox(PChar('������ ���������� � ������ "������ ��������"!'), PChar('�����������'), MB_ICONINFORMATION);
    UpdateGrid(Sender);
  end;
end;

procedure TfrmENServicesRentShow.actPrepaidExecute(Sender: TObject);
var TempENServicesObject: ENServicesObjectControllerSoapPort;
    objCode: Integer;
begin
  try
    objCode := StrToInt(sgENServicesObject.Cells[0, sgENServicesObject.Row]);
  except
    on EConvertError do Exit;
  end;

  if Application.MessageBox(PChar('�� ����� ������ �������� ���������� ������� �� ���������?'),
                            PChar('����� !'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
  begin
    TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;

    TempENServicesObject.prepaid(objCode);

    Application.MessageBox(PChar('���������� ������� ��������!'), PChar('�����������'), MB_ICONINFORMATION);
    UpdateGrid(Sender);
  end;
end;

procedure TfrmENServicesRentShow.actUnPrepaidExecute(
  Sender: TObject);
var TempENServicesObject: ENServicesObjectControllerSoapPort;
    objCode: Integer;
begin
  try
    objCode := StrToInt(sgENServicesObject.Cells[0, sgENServicesObject.Row]);
  except
    on EConvertError do Exit;
  end;

  if Application.MessageBox(PChar('�� ����� ������ ������� ������ ������������ �������?'),
                            PChar('����� !'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
  begin
    TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;

    TempENServicesObject.unPrepaid(objCode);

    Application.MessageBox(PChar('������ ������������ ������� �������!'), PChar('�����������'), MB_ICONINFORMATION);
    UpdateGrid(Sender);
  end;
end;

procedure TfrmENServicesRentShow.actDisclaimerCustomerServicesExecute(
  Sender: TObject);
var TempENServicesObject : ENServicesObjectControllerSoapPort;
    objCode : Integer;
begin

  try
    objCode := StrToInt(sgENServicesObject.Cells[0,sgENServicesObject.Row]);
  except
    on EConvertError do Exit;
  end;

  TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;

  if Application.MessageBox(PChar('�� ����� ������ ��������� ������ � ������ "³����� ��������� �� ������"???'),
                    PChar('����� !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin

    TempENServicesObject.disclaimerCustomerServices(objCode);

    Application.MessageBox(PChar('������ ������� ������...'), PChar('�����������'), MB_ICONINFORMATION);
    UpdateGrid(Sender);
  end;
end;


function TfrmENServicesRentShow.checkFamilySize2ServicesObject(servicesObjCode: Integer): Boolean;
var
  i : Integer;
  TempENFamilySize2ServicesObject : ENFamilySize2ServicesObjectControllerSoapPort;
  familySize2ServicesObjectFilter : ENFamilySize2ServicesObjectFilter;
  familySizeArr : ENFamilySize2ServicesObjectController.ArrayOfInteger;
begin
  Result := False;
  if (servicesObjCode = Low(Integer)) then Exit;

  TempENFamilySize2ServicesObject := HTTPRIOENFamilySize2ServicesObject as ENFamilySize2ServicesObjectControllerSoapPort;

  familySize2ServicesObjectFilter := ENFamilySize2ServicesObjectFilter.Create;
  SetNullIntProps(familySize2ServicesObjectFilter);
  SetNullXSProps(familySize2ServicesObjectFilter);
  familySize2ServicesObjectFilter.servicesObjectRef := ENServicesObjectRef.Create;
  familySize2ServicesObjectFilter.servicesObjectRef.code := servicesObjCode;

  familySizeArr := TempENFamilySize2ServicesObject.getScrollableFilteredCodeArray(familySize2ServicesObjectFilter,0,-1);
  if High(familySizeArr) > -1 then
    Result := True;
end;


end.
