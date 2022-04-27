
unit ShowRQOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2, tmsAdvGridExcel, AdvObj,
  RQOrderController, RQOrderItemController, xmldom, XMLIntf,
  msxmldom, XMLDoc, StrUtils ;


type
  TfrmRQOrderShow = class(TChildForm)  
  HTTPRIORQOrder: THTTPRIO;
    ImageList1: TImageList;
    sgRQOrder: TAdvStringGrid;
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
    actSelect: TAction;
    ToolButton4: TToolButton;
    actConfirm: TAction;
    N5: TMenuItem;
    N9: TMenuItem;
    actUnConfirm: TAction;
    N10: TMenuItem;
    aeExcel: TAdvGridExcelIO;
    actExportTo: TAction;
    N11: TMenuItem;
    N12: TMenuItem;
    HTTPRIORQOrderItem: THTTPRIO;
    actExportSelectedToAX: TAction;
    actExportSelectedToAX1: TMenuItem;
    xmlRQOrder: TXMLDocument;
    HTTPRIOENServicesObject: THTTPRIO;
    actChangeOrderPeriod: TAction;
    mniChangeOrderPeriod: TMenuItem;

procedure FormShow(Sender: TObject);
procedure FormClose(Sender: TObject; var Action: TCloseAction);
procedure sgRQOrderTopLeftChanged(Sender: TObject);
procedure sgRQOrderDblClick(Sender: TObject);
procedure actViewExecute(Sender: TObject);
procedure actEditExecute(Sender: TObject);
procedure actDeleteExecute(Sender: TObject);
procedure actInsertExecute(Sender: TObject);
procedure actUpdateExecute(Sender: TObject);
procedure actFilterExecute(Sender: TObject);
procedure actNoFilterExecute(Sender: TObject);
    procedure actConfirmExecute(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actUnConfirmExecute(Sender: TObject);
    procedure actExportToExecute(Sender: TObject);
    procedure actExportSelectedToAXExecute(Sender: TObject);
    procedure mniChangeOrderPeriodClick(Sender: TObject);
    procedure actChangeOrderPeriodExecute(Sender: TObject);



  private
   { Private declarations }
 public
   { Public declarations }
   tmpFilter : RQOrderFilter;
   procedure UpdateGrid(Sender: TObject);
   procedure AddListPos(var WholeList: String; NewListPos: String);

 end;

//var
 // RQOrderObj: RQOrder;
 // RQOrderFilterObj: RQOrderFilter;
  
  
implementation

uses Main, EditRQOrder, EditRQOrderFilter, RQOrderKindController, ENConsts,
  ENDepartmentController, DMReportsUnit//, ShowRQOrder
  , Globals
  , ShellAPI, RQOrderFormController, RQOrderResourceController, ENServicesObjectController,
  ChangeGeneralParam, RQOrderCreationMethodController;


{$R *.dfm}

var
  //frmRQOrderShow : TfrmRQOrderShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;

  RQOrderHeaders: array [1..13] of String =
        ( '���'
          ,'� ������'
          ,'� �������'
          ,'�����'//'����� (�����)'
          ,'���� ���������'
          ,'ϳ������'
          ,'��� ������'
          ,'��� ������'
          ,'��� �������'
          ,'�������������'
          ,'���� (� ���)'
          ,'������'
          ,'����������'
        );

// ���� ����� � ����� ���������� ������� ������� (RQOrderHeaders),
// �� ���������� �������� �� ������ � ���� ����������
const
  DEPARTMENT_COL_NUMBER = 5; // � ������� 'ϳ������'
  BUDGET_COL_NUMBER     = 9; // � ������� '�������������'


procedure TfrmRQOrderShow.AddListPos(var WholeList: String; NewListPos: String);
begin
  if WholeList <> '' then
    WholeList:=WholeList+', '+NewListPos
  else
    WholeList:=NewListPos;
end;  

procedure TfrmRQOrderShow.FormClose(Sender: TObject; var Action: TCloseAction);
var
  rqKind, creationMethod: Integer;
begin
    if (FormMode = fmChild) and (FilterObject <> nil) then
    begin

      rqKind := RQOrderFilter(FilterObject).kindRef.code;
      creationMethod := RQOrderFilter(FilterObject).creationMethodRef.code;

      if creationMethod = RQORDER_CREATION_METHOD_MANUAL then
      begin
        if rqKind = RQORDER_KIND_DEPARTMENT_ then
          frmRQOrderDepartmentShow := nil
        else
        if rqKind = RQORDER_KIND_BUDGET_ then
           frmRQOrderBudgetShow := nil
        else
        if rqKind = RQORDER_KIND_OE_ then
           frmRQOrderOEShow:=nil
        else
        if rqKind = RQORDER_KIND_OE_PLANNED_AUTO then
           frmRQOrderPlannedAutoShow:=nil
        else
        if rqKind = RQORDER_KIND_OE_NOPLANNED then
           frmRQOrderNoPlannedShow:=nil

        else
        if rqKind = RQORDER_KIND_PRODUCTION then
           frmRQOrderProductionShow := nil
        else
        if rqKind = RQORDER_KIND_OE_PLANNED_SERVICES then
           frmRQOrderPlanedServicesShow := nil
        else
        if rqKind = RQORDER_KIND_OE_NOPLANNED_SERVICES then
           frmRQOrderNoPlanedServicesShow := nil;
      end
      else if creationMethod = RQORDER_CREATION_METHOD_AUTO_AVZ then
        frmRQOrderAVZShow := nil
      else if creationMethod = RQORDER_CREATION_METHOD_AUTO_COUNTERS_SERVICES then
        frmRQOrderCountersServicesShow := nil
      else
        raise Exception.Create('�������� ����� ��������� ������!');


    end;
    inherited;
  end;


procedure TfrmRQOrderShow.FormShow(Sender: TObject);
var
  TempRQOrder: RQOrderControllerSoapPort;
  i, rqKind: Integer;
  RQOrderList: RQOrderShortList;
begin
  SetGridHeaders(RQOrderHeaders, sgRQOrder.ColumnHeaders);

  if FilterObject <> nil then
    if RQOrderFilter(FilterObject).kindRef <> nil then
    begin
      rqKind := RQOrderFilter(FilterObject).kindRef.code;

      // ��� ������ ����������������� ������ ������� "ϳ������"
      if rqKind = RQORDER_KIND_BUDGET_ then
        sgRQOrder.ColWidths[DEPARTMENT_COL_NUMBER] := 0;

      // ��� ������ �� ������ ������� "ϳ������" � "�������������"
      if rqKind = RQORDER_KIND_OE_ then
      begin
        sgRQOrder.ColWidths[DEPARTMENT_COL_NUMBER] := 0;
        sgRQOrder.ColWidths[BUDGET_COL_NUMBER] := 0;
      end;

      // ����� ���� ���_��� .. ���������� ������ ����� ...
      if rqKind = LOW_INT then
        RQOrderFilter(FilterObject).conditionSQL := 'rqorder.kindrefcode in ('+
               IntToStr( RQORDER_KIND_OE_PLANNED_AUTO ) + ',' + IntToStr(RQORDER_KIND_OE_NOPLANNED) + ',' +
               IntToStr(RQORDER_KIND_OE_PLANNED_SERVICES)+ ','+ IntToStr(RQORDER_KIND_OE_NOPLANNED_SERVICES) +')';

     { if rqKind = -2 then
      begin
        RQOrderFilter(FilterObject).kindRef := nil;
        RQOrderFilter(FilterObject).rqOrderResource := RQOrderResource.Create;
        RQOrderFilter(FilterObject).rqOrderResource.code := RQORDER_RESOURCE_SERVICES;
        RQOrderFilter(FilterObject).conditionSQL := 'rqorder.kindrefcode in ('+ IntToStr(RQORDER_KIND_OE_PLANNED_SERVICES)+ ','+ IntToStr(RQORDER_KIND_OE_NOPLANNED_SERVICES) +')';
      end; }

    end;


  ColCount:=100;
  //if FormMode = fmChild then
  TempRQOrder :=  HTTPRIORQOrder as RQOrderControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := RQOrderFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  if (tmpFilter <> nil) then
  begin
    tmpFilter.orderBySQL := 'dategen desc, RQORDER.code desc';
    RQOrderList := TempRQOrder.getScrollableFilteredList(tmpFilter, 0, ColCount);
  end
  else
  begin
    RQOrderFilter(FilterObject).orderBySQL := 'dategen desc, RQORDER.code desc';
    RQOrderList := TempRQOrder.getScrollableFilteredList(RQOrderFilter(FilterObject), 0, ColCount);
  end;

  LastCount:=High(RQOrderList.list);

  if LastCount > -1 then
     sgRQOrder.RowCount:=LastCount+2
  else
     sgRQOrder.RowCount:=2;

   with sgRQOrder do
    for i:=0 to LastCount do
      begin

        if RQOrderList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQOrderList.list[i].code)
        else
        Cells[0,i+1] := '';
        sgRQOrder.AddCheckBox(1,i+1,False,false);
        Cells[1,i+1] := RQOrderList.list[i].numberDoc;
        Cells[2,i+1] := RQOrderList.list[i].numberProject;
        if RQOrderList.list[i].orderPeriod = nil then
          Cells[3,i+1] := ''
        else
          //Cells[3,i+1] := XSDate2String(RQOrderList.list[i].orderPeriod);
          Cells[3,i+1] := MonthesNames[RQOrderList.list[i].orderPeriod.Month] + ' ' +
                          IntToStr(RQOrderList.list[i].orderPeriod.Year) + ' �.';

        if RQOrderList.list[i].dateGen = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := XSDate2String(RQOrderList.list[i].dateGen);

        Cells[5, i + 1] := RQOrderList.list[i].departmentRefShortName;
        Cells[6, i + 1] := RQOrderList.list[i].rqOrderFormName;
        Cells[7, i + 1] := RQOrderList.list[i].rqOrderTypeName;
        Cells[8, i + 1] := RQOrderList.list[i].rqOrderResourceName;
        Cells[9, i + 1] := RQOrderList.list[i].budgetRefShortName;

        Colors[9, i + 1] := clYellow;

        if RQOrderList.list[i].sumGen <> nil then
          //Cells[10, i + 1] := RQOrderList.list[i].sumGen.DecimalString
          Cells[10, i + 1] := SeparateThousands(RQOrderList.list[i].sumGen.DecimalString)
        else
          Cells[10, i + 1] := '0.00';

        Alignments[10, i + 1] := taRightJustify;
        Colors[10, i + 1] := $0080FF80;

        Cells[11, i + 1] := RQOrderList.list[i].statusRefName;

        Cells[12, i + 1] := RQOrderList.list[i].userGen;
{
        Application.ProcessMessages;
        if RQOrderList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQOrderList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := RQOrderList.list[i].numberDoc;
        Cells[2,i+1] := RQOrderList.list[i].numberProject;
        if RQOrderList.list[i].orderPeriod = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := XSDate2String(RQOrderList.list[i].orderPeriod);
        if RQOrderList.list[i].dateGen = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := XSDate2String(RQOrderList.list[i].dateGen);
        Cells[5,i+1] := RQOrderList.list[i].userGen;
}        
        LastRow:=i+1;
        sgRQOrder.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgRQOrder.Row:=1;
end;

procedure TfrmRQOrderShow.mniChangeOrderPeriodClick(Sender: TObject);
begin
  inherited;
    frmChangeGeneralParam:=TfrmChangeGeneralParam.Create(Application, dsEdit);

      try
        frmChangeGeneralParam.ShowModal;
      finally
        frmChangeGeneralParam.Free;
        frmChangeGeneralParam:=nil;
      end;
end;

procedure TfrmRQOrderShow.sgRQOrderTopLeftChanged(Sender: TObject);
var
  TempRQOrder: RQOrderControllerSoapPort;
  i,CurrentRow: Integer;
  RQOrderList: RQOrderShortList;
begin
  if LastCount < 99 then Exit;
  if (sgRQOrder.TopRow + sgRQOrder.VisibleRowCount) = ColCount
  then
    begin
      TempRQOrder :=  HTTPRIORQOrder as RQOrderControllerSoapPort;
      CurrentRow:=sgRQOrder.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := RQOrderFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  //RQOrderList := TempRQOrder.getScrollableFilteredList(RQOrderFilter(FilterObject),ColCount-1, 100);
  if (tmpFilter <> nil) then
  begin
    tmpFilter.orderBySQL := 'dategen desc, RQORDER.code desc';
    RQOrderList := TempRQOrder.getScrollableFilteredList(tmpFilter, ColCount-1, 100);
  end
  else
  begin
    RQOrderFilter(FilterObject).orderBySQL := 'dategen desc, RQORDER.code desc';
    RQOrderList := TempRQOrder.getScrollableFilteredList(RQOrderFilter(FilterObject), ColCount-1, 100);
  end;

  sgRQOrder.RowCount:=sgRQOrder.RowCount+100;
  LastCount:=High(RQOrderList.list);
  with sgRQOrder do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQOrderList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(RQOrderList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';

        sgRQOrder.AddCheckBox(1,i+CurrentRow,False,false);

        Cells[1,i+CurrentRow] := RQOrderList.list[i].numberDoc;
        Cells[2,i+CurrentRow] := RQOrderList.list[i].numberProject;
        if RQOrderList.list[i].orderPeriod = nil then
          Cells[3,i+CurrentRow] := ''
        else
          //Cells[3,i+CurrentRow] := XSDate2String(RQOrderList.list[i].orderPeriod);
          Cells[3,i+CurrentRow] := MonthesNames[RQOrderList.list[i].orderPeriod.Month] + ' ' +
                                   IntToStr(RQOrderList.list[i].orderPeriod.Year) + ' �.';

        if RQOrderList.list[i].dateGen = nil then
          Cells[4,i+CurrentRow] := ''
        else
          Cells[4,i+CurrentRow] := XSDate2String(RQOrderList.list[i].dateGen);
                    
        Cells[5, i + CurrentRow] := RQOrderList.list[i].departmentRefShortName;
        Cells[6, i + CurrentRow] := RQOrderList.list[i].rqOrderFormName;
        Cells[7, i + CurrentRow] := RQOrderList.list[i].rqOrderTypeName;
        Cells[8, i + CurrentRow] := RQOrderList.list[i].rqOrderResourceName;
        Cells[9, i + CurrentRow] := RQOrderList.list[i].budgetRefShortName;

        Colors[9, i + CurrentRow] := clYellow;

        if RQOrderList.list[i].sumGen <> nil then
          //Cells[10, i + CurrentRow] := RQOrderList.list[i].sumGen.DecimalString
          Cells[10, i + CurrentRow] := SeparateThousands(RQOrderList.list[i].sumGen.DecimalString)
        else
          Cells[10, i + CurrentRow] := '0.00';

        Alignments[10, i + CurrentRow] := taRightJustify;
        Colors[10, i + CurrentRow] := $0080FF80;

        Cells[11, i + CurrentRow] := RQOrderList.list[i].statusRefName;

        Cells[12, i + CurrentRow] := RQOrderList.list[i].userGen;

        {
        if RQOrderList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(RQOrderList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := RQOrderList.list[i].numberDoc;
        Cells[2,i+CurrentRow] := RQOrderList.list[i].numberProject;
        if RQOrderList.list[i].orderPeriod = nil then
          Cells[3,i+CurrentRow] := ''
        else
          Cells[3,i+CurrentRow] := XSDate2String(RQOrderList.list[i].orderPeriod);
        if RQOrderList.list[i].dateGen = nil then
          Cells[4,i+CurrentRow] := ''
        else
          Cells[4,i+CurrentRow] := XSDate2String(RQOrderList.list[i].dateGen);
        Cells[5,i+CurrentRow] := RQOrderList.list[i].userGen;
}
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgRQOrder.Row:=CurrentRow-5;
   sgRQOrder.RowCount:=LastRow+1;
  end;
end;

procedure TfrmRQOrderShow.sgRQOrderDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgRQOrder,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmRQOrderShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgRQOrder.RowCount-1 do
   for j:=0 to sgRQOrder.ColCount-1 do
     sgRQOrder.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmRQOrderShow.actViewExecute(Sender: TObject);
Var TempRQOrder: RQOrderControllerSoapPort;
    ObjCode : Integer;
begin
 TempRQOrder := HTTPRIORQOrder as RQOrderControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQOrder.Cells[0,sgRQOrder.Row]);
   except
   on EConvertError do Exit;
  end;

  frmRQOrderEdit:=TfrmRQOrderEdit.Create(Application, dsView);
  try
    frmRQOrderEdit.RQOrderObj := TempRQOrder.getObject(ObjCode);
    frmRQOrderEdit.ShowModal;
  finally
    frmRQOrderEdit.Free;
    frmRQOrderEdit:=nil;
  end;
end;


procedure TfrmRQOrderShow.actEditExecute(Sender: TObject);
var
  ObjCode : Integer;
  TempRQOrder: RQOrderControllerSoapPort;
  TempRQOrderItem: RQOrderItemControllerSoapPort;
begin

  TempRQOrder := HTTPRIORQOrder as RQOrderControllerSoapPort;
  TempRQOrderItem := HTTPRIORQOrderItem as RQOrderItemControllerSoapPort;

  try
    ObjCode := StrToInt(sgRQOrder.Cells[0,sgRQOrder.Row])
  except
    on EConvertError do Exit;
  end;

  
  frmRQOrderEdit:=TfrmRQOrderEdit.Create(Application, dsEdit);
  try
    frmRQOrderEdit.RQOrderObj := TempRQOrder.getObject(ObjCode);

    {
    // ������� ����� �� ������ ��������������� (���� ����� ������)

    if (frmRQOrderEdit.RQOrderObj.statusRef.code = RQORDER_STATUS_WORK_IN_MTS) then
    begin
        TempRQOrder.unPreConfirmBudeget(LOW_INT);
    end;
    }

    //08.02.2012 �������� ����� �� �������������� ������ ������ �� �������� � ����� � ����
    if (frmRQOrderEdit.RQOrderObj.statusRef.code = RQORDER_STATUS_WORK_IN_MTS) then
    begin
      // SUPP-16773... 12.05.2014 +++ �������������� ������ ������ �� ������ � ������� "� ����� � ����"
      if ((frmRQOrderEdit.RQOrderObj.kindRef.code = RQORDER_KIND_OE_PLANNED_SERVICES)
            or (frmRQOrderEdit.RQOrderObj.kindRef.code = RQORDER_KIND_OE_NOPLANNED_SERVICES)) then
        TempRQOrderItem.saveWorkInMtsServices()
      else
        TempRQOrderItem.saveWorkInMts();
    end;

{
  if (frmRQOrderEdit.RQOrderObj.statusRef.code = RQORDER_STATUS_WORK_IN_MTS) then
  begin
      Application.MessageBox(PChar('������ ��� � ����� � ���� ��� ...'), PChar('�����'), MB_ICONWARNING);
      exit;
  end;
}

    if frmRQOrderEdit.ShowModal= mrOk then
      begin
        //TempRQOrder.save(RQOrderObj);
        UpdateGrid(Sender);
      end;
  finally
    frmRQOrderEdit.Free;
    frmRQOrderEdit:=nil;
  end;

end;

procedure TfrmRQOrderShow.actDeleteExecute(Sender: TObject);
Var TempRQOrder: RQOrderControllerSoapPort;
  ObjCode: Integer;
  RQOrderObj : RQOrder;
begin
 TempRQOrder := HTTPRIORQOrder as RQOrderControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQOrder.Cells[0,sgRQOrder.Row]);
   except
   on EConvertError do Exit;
  end;

  RQOrderObj := TempRQOrder.getObject(ObjCode);
  if RQOrderObj = nil then Exit;

  //if RQOrderObj.kindRef.code = RQORDER_KIND_OE_NOPLANNED then
  //begin
     if  RQOrderObj.statusRef.code = RQORDER_STATUS_GOOD then
     begin
       if Application.MessageBox(PChar('�� ������������� ������ ������� (������) ?'),
                    PChar('�������� !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
       begin

         if RQOrderObj.kindRef.code = RQORDER_KIND_OE_PLANNED_AUTO then
           TempRQOrder.removeOEPlannedAuto(RQOrderObj.code)
         else
         if RQOrderObj.kindRef.code = RQORDER_KIND_OE_NOPLANNED then
           TempRQOrder.removeOENoPlanned(RQOrderObj.code)
         else
         if RQOrderObj.kindRef.code = RQORDER_KIND_OE_PLANNED_SERVICES then
           TempRQOrder.removeOEPlannedServices(RQOrderObj.code)
         else
         if RQOrderObj.kindRef.code = RQORDER_KIND_OE_NOPLANNED_SERVICES then
           TempRQOrder.removeOENOPlannedServices(RQOrderObj.code)
         else
           //TempRQOrder.removeOENoPlanned(RQOrderObj.code); //??
           raise Exception.Create('�������� ��� ������!'); 

           /////// **** TempRQOrder.removeOENoPlanned(RQOrderObj.code)

         UpdateGrid(Sender);
       end;
     end
     else
       ShowMessage('�������� ����� ������ ����� � �������� "����������� �����" !!!');
  //end;


{
  //if (RQOrderObj.statusRef.code <> RQORDER_STATUS_GOOD) then
  if (RQOrderObj.statusRef.code = RQORDER_STATUS_CLOSED) then
  begin
      Application.MessageBox(PChar('������ ��� ����������� ...'), PChar('�����'), MB_ICONWARNING);
      exit;
  end;

  if Application.MessageBox(PChar('�� ������������� ������ ������� (������) ?'),
                    PChar('�������� !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      //TempRQOrder.remove(ObjCode);
      if RQOrderObj.kindRef.code = RQORDER_KIND_OE_PLANNED_AUTO then
         TempRQOrder.removeOEPlannedAuto(ObjCode)
      else
      if  RQOrderObj.kindRef.code = RQORDER_KIND_OE_NOPLANNED then
         TempRQOrder.removeOENoPlanned(ObjCode)
      else
        showMessage('error on OrderKindCode');
      UpdateGrid(Sender);
  end;
  }
end;

procedure TfrmRQOrderShow.actInsertExecute(Sender: TObject);
Var TempRQOrder: RQOrderControllerSoapPort;
begin
  TempRQOrder := HTTPRIORQOrder as RQOrderControllerSoapPort;

  if FilterObject = nil then Exit;

  try
    frmRQOrderEdit:=TfrmRQOrderEdit.Create(Application, dsInsert);

  frmRQOrderEdit.RQOrderObj:=RQOrder.Create;

   frmRQOrderEdit.RQOrderObj.orderPeriod:= TXSDate.Create;
   frmRQOrderEdit.RQOrderObj.dateGen:= TXSDate.Create;
   frmRQOrderEdit.RQOrderObj.dateEdit:= TXSDate.Create;

  frmRQOrderEdit.RQOrderObj.kindRef := RQOrderKindRef.Create;
  frmRQOrderEdit.RQOrderObj.kindRef.code := RQOrderFilter(FilterObject).kindRef.code;

  if RQOrderFilter(FilterObject).creationMethodRef <> nil then
    if RQOrderFilter(FilterObject).creationMethodRef.code > LOW_INT then
    begin
      frmRQOrderEdit.RQOrderObj.creationMethodRef := RQOrderCreationMethodRef.Create;
      frmRQOrderEdit.RQOrderObj.creationMethodRef.code := RQOrderFilter(FilterObject).creationMethodRef.code;
    end;

  if RQOrderFilter(FilterObject).budgetRef <> nil then
  begin
      if RQOrderFilter(FilterObject).budgetRef.code > LOW_INT then
      begin
          if frmRQOrderEdit.RQOrderObj.budgetRef = nil then frmRQOrderEdit.RQOrderObj.budgetRef := ENDepartment.Create;
          frmRQOrderEdit.RQOrderObj.budgetRef.code := RQOrderFilter(FilterObject).budgetRef.code;
          frmRQOrderEdit.RQOrderObj.budgetRef.name := RQOrderFilter(FilterObject).budgetRef.name;
          //frmRQOrderEdit.DisableActions(frmRQOrderEdit.actEdit);
      end;
  end;

  

  if RQOrderFilter(FilterObject).departmentRef <> nil then
  begin
      if RQOrderFilter(FilterObject).departmentRef.code > LOW_INT then
      begin
          if frmRQOrderEdit.RQOrderObj.departmentRef = nil then frmRQOrderEdit.RQOrderObj.departmentRef := ENDepartment.Create;
          frmRQOrderEdit.RQOrderObj.departmentRef.code := RQOrderFilter(FilterObject).departmentRef.code;
          frmRQOrderEdit.RQOrderObj.departmentRef.name := RQOrderFilter(FilterObject).departmentRef.name;
          //frmRQOrderEdit.DisableActions(frmRQOrderEdit.actEdit);
      end;
  end;

    try
      if frmRQOrderEdit.ShowModal = mrOk then
      begin
        if frmRQOrderEdit.RQOrderObj<>nil then
            //TempRQOrder.add(RQOrderObj);
            UpdateGrid(Sender);
      end;
    finally
      frmRQOrderEdit.Free;
      frmRQOrderEdit:=nil;
    end;
  finally
    //RQOrderObj.Free;
  end;
end;

procedure TfrmRQOrderShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmRQOrderShow.actFilterExecute(Sender: TObject);
var kindCode, creationMethodCode: Integer;
begin
  kindCode := -1;
  creationMethodCode := -1;

  frmRQOrderFilterEdit:=TfrmRQOrderFilterEdit.Create(Application, dsEdit);
  try
    RQOrderFilterObj := RQOrderFilter.Create;
    SetNullIntProps(RQOrderFilterObj);
    SetNullXSProps(RQOrderFilterObj);

    if FilterObject <> nil then
      if RQOrderFilter(FilterObject).kindRef <> nil then
         kindCode := RQOrderFilter(FilterObject).kindRef.code;

    if FilterObject <> nil then
      if RQOrderFilter(FilterObject).creationMethodRef <> nil then
         creationMethodCode := RQOrderFilter(FilterObject).creationMethodRef.code;

    if kindCode = RQORDER_KIND_BUDGET_ then
       frmRQOrderFilterEdit.HideControls([frmRQOrderFilterEdit.lblENDepartmentDepartmentRefName, frmRQOrderFilterEdit.edtENDepartmentDepartmentRefName, frmRQOrderFilterEdit.spbENDepartmentDepartmentRef]);

    //if kindCode in [RQORDER_KIND_OE_, RQORDER_KIND_OE_PLANNED_AUTO, RQORDER_KIND_OE_NOPLANNED]  then
    if kindCode in [RQORDER_KIND_OE_, RQORDER_KIND_OE_PLANNED_AUTO]  then
       frmRQOrderFilterEdit.HideControls([frmRQOrderFilterEdit.lblENDepartmentDepartmentRefName, frmRQOrderFilterEdit.edtENDepartmentDepartmentRefName, frmRQOrderFilterEdit.spbENDepartmentDepartmentRef
                                          , frmRQOrderFilterEdit.lblENDepartmentBudgetRefName, frmRQOrderFilterEdit.edtENDepartmentBudgetRefName, frmRQOrderFilterEdit.spbENDepartmentBudgetRef ]);

    // ��� ����� .. ������ ��������/���������� ...
    if kindCode in [RQORDER_KIND_OE_PLANNED_AUTO, RQORDER_KIND_OE_NOPLANNED]  then
    begin
        frmRQOrderFilterEdit.DisableControls([frmRQOrderFilterEdit.spbRQOrderFormRqOrderForm, frmRQOrderFilterEdit.edtRQOrderFormRqOrderFormName]);
        RQOrderFilterObj.rqOrderForm := RQOrderForm.Create;

        if  kindCode  = RQORDER_KIND_OE_PLANNED_AUTO then
        begin
            RQOrderFilterObj.rqOrderForm.code := RQORDER_FORM_PLANNED;
            frmRQOrderFilterEdit.edtRQOrderFormRqOrderFormName.Text := '�������';
        end;
        if  kindCode  = RQORDER_KIND_OE_NOPLANNED then
        begin
            RQOrderFilterObj.rqOrderForm.code := RQORDER_FORM_NOTPLANNED;
            frmRQOrderFilterEdit.edtRQOrderFormRqOrderFormName.Text := '�����������';
        end;
    end;


    if kindCode in [RQORDER_KIND_OE_PLANNED_SERVICES, RQORDER_KIND_OE_NOPLANNED_SERVICES] then
       RQOrderFilterObj.conditionSQL := ' rqorder.kindrefcode in (' +
          IntToStr(RQORDER_KIND_OE_PLANNED_SERVICES) + ', ' + IntToStr(RQORDER_KIND_OE_NOPLANNED_SERVICES) + ')';


    RQOrderFilterObj.kindRef := RQOrderKindRef.Create;
    RQOrderFilterObj.kindRef.code := kindCode;

    // +++ 22.02.2012 +++ ������ ������ ���/������ ������� � ����� �������������� ����������
    if FilterObject <> nil then
     if RQOrderFilter(FilterObject).rqOrderResource <> nil then
     begin
       RQOrderFilterObj.rqOrderResource := RQOrderResource.Create;
       RQOrderFilterObj.rqOrderResource.code := RQOrderFilter(FilterObject).rqOrderResource.code;
       RQOrderFilterObj.kindRef := nil;
     end;

    ////////////////////////////
    if creationMethodCode > 0 then
    begin
       frmRQOrderFilterEdit.DisableControls([frmRQOrderFilterEdit.cbCreationMethod]);
       frmRQOrderFilterEdit.cbCreationMethod.ItemIndex := creationMethodCode;
    end;
    ////////////////////////////


    if kindCode = RQORDER_KIND_OE_NOPLANNED then
       HideControls([frmRQOrderFilterEdit.lblTKTransportRealTransportRealName
        ,frmRQOrderFilterEdit.edtTKTransportRealTransportRealName
        ,frmRQOrderFilterEdit.spbTKTransportRealTransportReal],false);

    if frmRQOrderFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := RQOrderFilter.Create;
      FilterObject := RQOrderFilterObj;
      actUpdateExecute(Sender);
    end;

    
  finally
    frmRQOrderFilterEdit.Free;
    frmRQOrderFilterEdit:=nil;
  end;

  
end;

procedure TfrmRQOrderShow.actNoFilterExecute(Sender: TObject);
var
  kindCode, resourceCode, creationMethodCode: integer;
begin
  kindCode := LOW_INT;
  resourceCode := LOW_INT;
  creationMethodCode := LOW_INT;

  if FilterObject <> nil then
    if RQOrderFilter(FilterObject).kindRef <> nil then
      kindCode := RQOrderFilter(FilterObject).kindRef.code;

    // +++ 22.02.2012 +++ ������ ������ ���/������ ������� � ����� �������������� ����������
    if RQOrderFilter(FilterObject).rqOrderResource <> nil then
       begin
         resourceCode := RQOrderFilter(FilterObject).rqOrderResource.code;
         kindCode := -1;
       end;

  if FilterObject <> nil then
    if RQOrderFilter(FilterObject).creationMethodRef <> nil then
       creationMethodCode := RQOrderFilter(FilterObject).creationMethodRef.code;

  /////

  FilterObject.Free;
  FilterObject := nil;

  ///// ����������� ������ � ���������� ������� ��� 
  FilterObject := RQOrderFilter.Create;
  SetNullIntProps(FilterObject);
  SetNullXSProps(FilterObject);

  if (resourceCode <> LOW_INT) then
  begin
    RQOrderFilter(FilterObject).rqOrderResource := RQOrderResource.Create();
    RQOrderFilter(FilterObject).rqOrderResource.code := resourceCode;

    if (resourceCode = RQORDER_RESOURCE_TMC) then
      RQOrderFilter(FilterObject).conditionSQL := 'rqorder.kindrefcode in (' +
         IntToStr(RQORDER_KIND_OE_PLANNED_AUTO) +','+ IntToStr(RQORDER_KIND_OE_NOPLANNED) + ')';

    if (resourceCode = RQORDER_RESOURCE_SERVICES) then
      RQOrderFilter(FilterObject).conditionSQL := 'rqorder.kindrefcode in (' +
         IntToStr(RQORDER_KIND_OE_PLANNED_SERVICES) +','+ IntToStr(RQORDER_KIND_OE_NOPLANNED_SERVICES) + ')';

  end else
  begin
    RQOrderFilter(FilterObject).kindRef := RQOrderKindRef.Create();
    RQOrderFilter(FilterObject).kindRef.code := kindCode;
  end;

  if creationMethodCode <> LOW_INT then
  begin
    RQOrderFilter(FilterObject).creationMethodRef := RQOrderCreationMethodRef.Create();
    RQOrderFilter(FilterObject).creationMethodRef.code := creationMethodCode;
  end;

  if kindCode = LOW_INT then
    RQOrderFilter(FilterObject).conditionSQL := 'rqorder.kindrefcode in ('+ IntToStr( RQORDER_KIND_OE_PLANNED_AUTO ) +','+ IntToStr(RQORDER_KIND_OE_NOPLANNED) + ','+ IntToStr(RQORDER_KIND_OE_PLANNED_SERVICES)+ ','+ IntToStr(RQORDER_KIND_OE_NOPLANNED_SERVICES) + ')';

  /////

  UpdateGrid(Sender);
end;

procedure TfrmRQOrderShow.actChangeOrderPeriodExecute(Sender: TObject);
begin
 
    frmChangeGeneralParam:=TfrmChangeGeneralParam.Create(Application, dsEdit);

      try
        frmChangeGeneralParam.orderCode:= StrToInt(sgRQOrder.Cells[0,sgRQOrder.Row]);
        frmChangeGeneralParam.Caption:= '�������� ������ ������';

         if frmChangeGeneralParam.ShowModal = mrOk then
            UpdateGrid(Sender);

      finally
        frmChangeGeneralParam.Free;
        frmChangeGeneralParam:=nil;

      end;
//   end;
end;


procedure TfrmRQOrderShow.actConfirmExecute(Sender: TObject);
var
  TempRQOrder: RQOrderControllerSoapPort;
  ObjCode : Integer;
  order : RQOrder;
begin
  try
    ObjCode := StrToInt(sgRQOrder.Cells[0,sgRQOrder.Row]);
  except
    on EConvertError do Exit;
  end;

  if Application.MessageBox(PChar('���������� ������ ?'),
                    PChar('�������� !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempRQOrder := HTTPRIORQOrder as RQOrderControllerSoapPort;
    order := TempRQOrder.getObject(ObjCode);

    //  "4"	"��� �������"
    if (order.kindRef.code = RQORDER_KIND_OE_PLANNED_AUTO) then
      TempRQOrder.confirmBudget(ObjCode)

    //  "5"	"��� �����������"
    else if (order.kindRef.code = RQORDER_KIND_OE_NOPLANNED) then
      TempRQOrder.confirmNoPlaned(ObjCode)

    //  "6"	"������������"
    else if (order.kindRef.code = RQORDER_KIND_PRODUCTION) then
      TempRQOrder.confirmProduction(ObjCode)

    //  "7"	"�������� (������)"
    else if (order.kindRef.code = RQORDER_KIND_OE_PLANNED_SERVICES) then
      TempRQOrder.confirmServices(ObjCode)

    //  "8"	"�� �������� (������)"
    else if (order.kindRef.code = RQORDER_KIND_OE_NOPLANNED_SERVICES) then
      TempRQOrder.confirmNoPlanedServices(ObjCode)

    else
        ShowMessage('��������� ��� ���������� ...');


    UpdateGrid(Sender);

{
      orderObj := TempRQOrder.getObject(ObjCode);

      if (orderObj.kindRef.code = RQORDER_KIND_DEPARTMENT) then
           TempRQOrder.confirmDepartment(ObjCode)
      else
      if (orderObj.kindRef.code = RQORDER_KIND_BUDGET) then
      begin
      // ��������� ������������ ����������
           if  orderObj.statusRef.code = RQORDER_STATUS_CREATED then
             TempRQOrder.confirmBudget(ObjCode)
           else
             TempRQOrder.preConfirmBudget(ObjCode);
      end
      else
      if (orderObj.kindRef.code = RQORDER_KIND_OE) then
           TempRQOrder.confirmOE(ObjCode)
      else
        ShowMessage('��������� ��� ���������� ...');
}

  end;


end;

procedure TfrmRQOrderShow.PopupMenu1Popup(Sender: TObject);
var
   order : RQOrder;
   objCode : Integer;
begin
  inherited;

   try
     objCode := StrToInt(sgRQOrder.Cells[0,sgRQOrder.Row]);
   except
     on EConvertError do Exit;
   end;

   DisableActions([actConfirm, actUnConfirm]);

  order := DMReports.getRQOrder(objCode);
  if order = nil then exit;

  if (order.kindRef.code in [RQORDER_KIND_OE_PLANNED_SERVICES, RQORDER_KIND_OE_NOPLANNED_SERVICES]) then
  begin
    actConfirm.Caption :='��������� � ������ ���...';
    actUnConfirm.Caption := '³������ ����������� � ������ ���...';
  end else
  begin
    actConfirm.Caption := '��������� � ������  ���� ...';
    actUnConfirm.Caption := '³������ ����������� � ������ ���� ...';
  end;

  actConfirm.Enabled := (order.statusRef.code = RQORDER_STATUS_CREATED);
  actConfirm.Visible := actConfirm.Enabled;

  actUnConfirm.Enabled :=  (order.statusRef.code = RQORDER_STATUS_WORK_IN_MTS);
  actUnConfirm.Visible := actUnConfirm.Enabled;

  actChangeOrderPeriod.Visible:= ( ((order.statusRef.code = RQORDER_STATUS_CREATED)
                                   and
                                   ( order.rqOrderForm.code = RQORDER_FORM_NOTPLANNED )
                                   and
                                   ( order.kindRef.code = RQORDER_KIND_OE_NOPLANNED_SERVICES )
                                   )
                                     );


end;

procedure TfrmRQOrderShow.FormCreate(Sender: TObject);
begin
  inherited;
  tmpFilter := nil;
  //rqKind := LOW_INT;
end;

procedure TfrmRQOrderShow.actUnConfirmExecute(Sender: TObject);
var
  TempRQOrder: RQOrderControllerSoapPort;
  ObjCode : Integer;
  order : RQOrder;
begin
  try
    ObjCode := StrToInt(sgRQOrder.Cells[0,sgRQOrder.Row]);
  except
    on EConvertError do Exit;
  end;

  if Application.MessageBox(PChar('³������ ������������ ������ ?'),
                    PChar('�������� !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempRQOrder := HTTPRIORQOrder as RQOrderControllerSoapPort;
    order := TempRQOrder.getObject(ObjCode);

    //  "4"	"��� �������"
    if (order.kindRef.code = RQORDER_KIND_OE_PLANNED_AUTO) then
      TempRQOrder.unPreConfirmBudeget(ObjCode)

    //  "5"	"��� �����������"
    else if (order.kindRef.code = RQORDER_KIND_OE_NOPLANNED) then
      TempRQOrder.unConfirmNoPlaned(ObjCode)

    //  "6"	"������������"
    else if (order.kindRef.code = RQORDER_KIND_PRODUCTION) then
      TempRQOrder.unConfirmProduction(ObjCode)

    //  "7"	"�������� (������)"
    else if (order.kindRef.code = RQORDER_KIND_OE_PLANNED_SERVICES) then
      TempRQOrder.unConfirmServices(ObjCode)

    //  "8"	"�� �������� (������)"
    else if (order.kindRef.code = RQORDER_KIND_OE_NOPLANNED_SERVICES) then
      TempRQOrder.unConfirmNoPlanedServices(ObjCode)

    else
        ShowMessage('��������� ��� ���������� ...');


    UpdateGrid(Sender);

{
      orderObj := TempRQOrder.getObject(ObjCode);

      if (orderObj.kindRef.code = RQORDER_KIND_DEPARTMENT) then
           TempRQOrder.unConfirmDepartment(ObjCode)
      else
      if (orderObj.kindRef.code = RQORDER_KIND_BUDGET) then
      begin
      // ��������� ������������ ����������
           if  orderObj.statusRef.code = RQORDER_STATUS_CREATED then
             TempRQOrder.unPreConfirmBudeget(ObjCode)
           else
             TempRQOrder.unConfirmBudeget(ObjCode);
      end
      else
      if (orderObj.kindRef.code = RQORDER_KIND_OE) then
           TempRQOrder.unConfirmOE(ObjCode)
      else
        ShowMessage('���������� ��� ���������� ...');
}

  end;
  
  
end;

procedure TfrmRQOrderShow.actExportToExecute(Sender: TObject);
var AppPath, FileName: String;
    OldCursor: TCursor;
begin
  OldCursor := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;

    AppPath := ExtractFilePath(Application.ExeName);
    if not DirectoryExists(AppPath + TempReportsPath) then
      CreateDir(AppPath + TempReportsPath);
    FileName := AppPath + TempReportsPath + GetFileName('request') + '.xls';

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

procedure TfrmRQOrderShow.actExportSelectedToAXExecute(Sender: TObject);
 var state, isSel : Boolean;
TempRQOrder: RQOrderControllerSoapPort;
TempRQOrderItem : RQOrderItemControllerSoapPort;
orderList : RQOrderShortList;
orderFilter : RQOrderFilter;
orderPeriod : string;
orderCodes, orderNumbers : string;
orderItemList: RQOrderItemShortList;
orderItemFilter : RQOrderItemFilter;
i, m, orderCode : Integer;

  strName: String;
  xml: TStringList;
  isBinded: Boolean;
  packNode, requestNode, stringsNode, itemNode, nameNode: IXMLNode;
  budgCode, itemID, requestNum: Integer;
  str, AppPath, ExportPath, fileName, strOrderType, strOrderForm : string;

  TempENServicesObject: ENServicesObjectControllerSoapPort;
  agreeList: ENServicesObjectShortList;
  agreeFilter: ENServicesObjectFilter;

begin
 state := false;
 isSel := false;

  for i := 1 to sgRQOrder.RowCount - 1 do
  begin
    sgRQOrder.GetCheckBoxState(1, i, state);
    if state then
    begin
      isSel := true;
      break;
    end;
  end;

  if not isSel then
  begin
    Application.MessageBox(PChar('������� ���� � ���� ������ ��� ��������!'), PChar('����� !'), MB_ICONWARNING);
    Exit;
  end;

  if Application.MessageBox(PChar('�� ����� ������ ������������ �� ����� ������ �� ��?'),
                            PChar('����� !'),
                            MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) <> IDOK then
    Exit;

  TempRQOrder := HTTPRIORQOrder as RQOrderControllerSoapPort;

  for i := 1 to sgRQOrder.RowCount - 1 do
  begin
    sgRQOrder.GetCheckBoxState(1, i, state);
    if state then
    begin
        AddListPos(orderCodes, sgRQOrder.Cells[0,i]);
        AddListPos(orderNumbers, sgRQOrder.Cells[1,i]);
    end;
  end;

    orderFilter := RQOrderFilter.Create;
    SetNullIntProps(orderFilter);
    SetNullXSProps(orderFilter);
    orderFilter.conditionSQL := ' code in (' + orderCodes + ')';

    orderList := TempRQOrder.getScrollableFilteredList(orderFilter,0,-1);

    orderPeriod := XSDate2String(orderList.list[0].orderPeriod);

   for m := 1 to orderList.totalCount - 1 do
   begin
        if orderPeriod <> XSDate2String(orderList.list[m].orderPeriod) then
        begin
        ShowMessage('������ ������ ���� ������ ������!');
        Exit;
        end;

   end;

   TempRQOrderItem := HTTPRIORQOrderItem as RQOrderItemControllerSoapPort;
   orderItemFilter := RQOrderItemFilter.Create;
   SetNullIntProps(orderItemFilter);
   SetNullXSProps(orderItemFilter);
   orderItemFilter.conditionSQL := ' rqorderitem.orderrefcode in (' + orderCodes + ')' +
                                   ' and rqorderitem.statusrefcode = ' + IntToStr(RQORDERITEM_STATUS_GOOD) +
                                   ' and rqorderitem.orgcode in (select rqorg.code from rqorg where rqorg.codeorg = ''05�9'')';

   orderItemFilter.orderBySQL :=  'rqorderitem.orderrefcode, rqorderitem.budgetrefcode';

   orderItemList := TempRQOrderItem.getScrollableFilteredList(orderItemFilter,0,-1);

  if High(orderItemList.list) = -1 then
  begin
    Application.MessageBox(PChar('������ �� �������� ����������!' + #13#10 +
                                 '������� �������!'),
                           PChar('��������!'), MB_ICONWARNING);
    Exit;
  end;

   AppPath := ExtractFilePath(Application.ExeName);
  ExportPath := AppPath + RQOrderExportPath + '������\';
  if not DirectoryExists(AppPath + RQOrderExportPath) then
    CreateDir(AppPath + RQOrderExportPath);
  if not DirectoryExists(ExportPath) then
    CreateDir(ExportPath);

  fileName := '������_���_' + orderNumbers + '_';
  fileName := GetFileName(fileName) + '.xml';

  xmlRQOrder.Active := false;
  xmlRQOrder.XML.Clear;
  xmlRQOrder.Active := true;

  // 05.09.2013... +++ � �� �������� ���������� !!!!
  // xmlRQOrder.Encoding := 'windows-1251'; // 04.11.11 ��� ��� ���� ��������� ��������� !!!!!

  //stringsNode := xmlRQOrder.AddChild('strings');
  packNode := xmlRQOrder.AddChild('pack');

//  xmlRQOrder.DocumentElement.AddChild('matherials');

  budgCode := LOW_INT;
  orderCode := LOW_INT;

  requestNum := 0;

  for i := 0 to High(orderItemList.list) do
  begin
    if orderItemList.list[i].budgetRefCode = LOW_INT then
      raise Exception.Create('�������� ������������� ��� ������ ������! ��� ������: ' + IntToStr(orderItemList.list[i].code));

    if (orderItemList.list[i].budgetRefCode <> budgCode) or
       (orderItemList.list[i].orderRefCode <> orderCode) then
    begin
      budgCode := orderItemList.list[i].budgetRefCode;
      orderCode := orderItemList.list[i].orderRefCode;
      inc(requestNum);

      requestNode := packNode.AddChild('request');

      requestNode.AddChild('NDOC').Text := IntToStr(requestNum);

      if orderList.list[0].orderPeriod <> nil then
        requestNode.AddChild('DT').Text := DateToStr(EncodeDate(orderList.list[0].orderPeriod.Year,
                                                                orderList.list[0].orderPeriod.Month,
                                                                orderList.list[0].orderPeriod.Day))
      else
        raise Exception.Create('�� ������� ����� ������!');


      // ������� ����������: 0 - ������� (�����������), 1 - ��������
      if orderItemList.list[i].orderRefFormCode = RQORDER_FORM_NOTPLANNED then
        requestNode.AddChild('PLAN').Text := '0'
      else if orderItemList.list[i].orderRefFormCode = RQORDER_FORM_PLANNED then
        requestNode.AddChild('PLAN').Text := '1'
      else
        raise Exception.Create('�� ����� ������ �� �����������!');

      // ������� �����������: 0 - ���������������, 1 - ���������
      if orderItemList.list[i].orderRefTypeCode = RQORDER_TYPE_INVEST then
        requestNode.AddChild('BUDG').Text := '0'
      else if orderItemList.list[i].orderRefTypeCode = RQORDER_TYPE_BUDGET then
        requestNode.AddChild('BUDG').Text := '1'
      else
        raise Exception.Create('��� ��� ������ �� �����������!');

      requestNode.AddChild('ORG').Text := 'main_kh';

      requestNode.AddChild('SERVICE_CODE').Text := orderItemList.list[i].budgetRefCFOCode;
      requestNode.AddChild('SERVICE_NAME').Text := orderItemList.list[i].budgetRefShortName;
      requestNode.AddChild('BUDGET_LINE_CODE').Text := AnsiReplaceText(orderItemList.list[i].ddsCodesTxtCode, ' ', '');
      requestNode.AddChild('BUDGET_LINE_NAME').Text := orderItemList.list[i].ddsCodesName;

      stringsNode := requestNode.AddChild('strings');

      itemID := 0;
    end;

    // ����� ������ ������
    inc(itemID);
    itemNode := stringsNode.AddChild('string');
    itemNode.AddChild('ID').Text := IntToStr(itemID);
    itemNode.AddChild('ID_AX').Text := orderItemList.list[i].axMaterialsRefForeign_link_code;
    itemNode.AddChild('NAME').Text := orderItemList.list[i].axMaterialsRefName_al; //orderItemList.list[i].axMaterialsRefName; //orderItemList.list[i].materialName;
    itemNode.AddChild('DESC').Text := orderItemList.list[i].commentGen;
    itemNode.AddChild('ED_IZM').Text :=  TempRQOrderItem.getMeasurementForAX(orderItemList.list[i].measurementName ,orderItemList.list[i].axMaterialsRefMesure_text);

    itemNode.AddChild('VENDOR_CODE').Text := orderItemList.list[i].orgOkpo; //orderItemList.list[i].orgCodeorg;
    itemNode.AddChild('VENDOR_NAME').Text := orderItemList.list[i].orgName;

    itemNode.AddChild('AGREE_NUM').Text := orderItemList.list[i].contractNumber; //finDocCode;

    if orderItemList.list[i].finDocID > LOW_INT then
    begin
      TempENServicesObject :=  HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;

      agreeFilter := ENServicesObjectFilter.Create;
      SetNullIntProps(agreeFilter);
      SetNullXSProps(agreeFilter);

      agreeFilter.finDocID := orderItemList.list[i].finDocID;
      agreeList := TempENServicesObject.getContractList(agreeFilter, 0, -1);

      if agreeList.totalCount = 0 then
        raise Exception.Create('������ � ����� ' + IntToStr(agreeFilter.finDocID) +
                               ' �� �������� � �������� �������� Գ���������!' + #13#10 +
                               '(��� ������ ������: ' + IntToStr(orderItemList.list[i].code) + ')');

      if agreeList.list[0] = nil then
        raise Exception.Create('������ � ����� ' + IntToStr(agreeFilter.finDocID) +
                               ' �� �������� � �������� �������� Գ���������!' + #13#10 +
                               '(��� ������ ������: ' + IntToStr(orderItemList.list[i].code) + ')');

      if agreeList.list[0].contractDate <> nil then
        itemNode.AddChild('AGREE_IN_DATE').Text := XSDate2String(agreeList.list[0].contractDate)
      else
        itemNode.AddChild('AGREE_IN_DATE').Text := '';

      if agreeList.list[0].contractRegDate <> nil then
        itemNode.AddChild('AGREE_REG_DATE').Text := XSDate2String(agreeList.list[0].contractRegDate)
      else
        itemNode.AddChild('AGREE_REG_DATE').Text := '';

      if agreeList.list[0].contractStartDate <> nil then
        itemNode.AddChild('AGREE_START_DATE').Text := XSDate2String(agreeList.list[0].contractStartDate)
      else
        itemNode.AddChild('AGREE_START_DATE').Text := '';

      itemNode.AddChild('AGREE_DESCRIPTION').Text := agreeList.list[0].commentGen;
    end // if orderItemList.list[i].finDocID > LOW_INT
    else begin
      if orderItemList.list[i].contractDate <> nil then
        itemNode.AddChild('AGREE_IN_DATE').Text := XSDate2String(orderItemList.list[i].contractDate)
      else
        itemNode.AddChild('AGREE_IN_DATE').Text := '';

      itemNode.AddChild('AGREE_REG_DATE').Text := '';
      itemNode.AddChild('AGREE_START_DATE').Text := '';
      itemNode.AddChild('AGREE_DESCRIPTION').Text := '';
    end;

    /////

    itemNode.AddChild('QUANTITY').Text := orderItemList.list[i].countFact.DecimalString;
    itemNode.AddChild('SUMMA').Text := orderItemList.list[i].sumGen.DecimalString;
    itemNode.AddChild('PRICE').Text := orderItemList.list[i].priceWithNds.DecimalString;
    itemNode.AddChild('BASIC_PRICE').Text := orderItemList.list[i].priceWithoutNds.DecimalString;
  end;

  // xmlRQOrder.XML.SaveToFile(ExportPath + fileName);

  // 05.09.13
  xml := TStringList.Create;
  try
    xml.Add('<?xml version="1.0" encoding="windows-1251" ?>');
    xml.Add(xmlRQOrder.XML.Text);
    xml.SaveToFile(ExportPath + fileName);
  finally
    xml.Free;
  end;

  xmlRQOrder.Active := false;

  Application.MessageBox(PChar('������� ������� ��������!' + #13#10 +
                               '������ ��������� � ���� "' + ExportPath + fileName + '" !'),
                         PChar('���������'), MB_ICONINFORMATION);
end;

end.
