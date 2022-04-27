//������� ����� ������������� ��������
unit ShowENMeasurDevChange;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENMeasurDevChangeController, AdvObj ;


type
  TfrmENMeasurDevChangeShow = class(TChildForm)  
  HTTPRIOENMeasurDevChange: THTTPRIO;
    ImageList1: TImageList;
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
    sgENMeasurDevChange: TAdvStringGrid;

procedure FormShow(Sender: TObject);
procedure FormClose(Sender: TObject; var Action: TCloseAction);
procedure sgENMeasurDevChangeTopLeftChanged(Sender: TObject);
procedure sgENMeasurDevChangeDblClick(Sender: TObject);
procedure actViewExecute(Sender: TObject);
procedure actEditExecute(Sender: TObject);
procedure actDeleteExecute(Sender: TObject);
procedure actInsertExecute(Sender: TObject);
procedure actUpdateExecute(Sender: TObject);
procedure actFilterExecute(Sender: TObject);
procedure actNoFilterExecute(Sender: TObject);

  private
   { Private declarations }
 public
   { Public declarations }
   procedure UpdateGrid(Sender: TObject);
 end;

var
 frmENMeasurDevChangeShow : TfrmENMeasurDevChangeShow;
 // ENMeasurDevChangeObj: ENMeasurDevChange;
 // ENMeasurDevChangeFilterObj: ENMeasurDevChangeFilter;
  
  
implementation

uses Main, EditENMeasurDevChange, EditENMeasurDevChangeFilter;


{$R *.dfm}

var
  //frmENMeasurDevChangeShow : TfrmENMeasurDevChangeShow;


  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENMeasurDevChangeHeaders: array [1..18] of String =
        (  '��� �������'
          ,'�������� ������'
          ,'�����������'
          ,'�����'
          ,'����� ������'
          ,'���� ������'
          ,'����� ����'
          ,'���� ���������� ����'
          ,'���������� ������'
          ,'������������'
          ,'��� ������������'
          ,'��� �� 10 - 6 / 0,4 ��'
          ,'��� ��������������'
          ,'��� �������������� ������'
          ,'��� �������������� ����'
          ,'��� ������ ���'
          ,'��� ���������� �������������'
          ,'����� ���������'
        );
   

procedure TfrmENMeasurDevChangeShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENMeasurDevChangeShow:=nil;
    inherited;
  end;


procedure TfrmENMeasurDevChangeShow.FormShow(Sender: TObject);
var TempENMeasurDevChange: ENMeasurDevChangeControllerSoapPort;
  i: Integer;
  ENMeasurDevChangeList: ENMeasurDevChangeShortList;
begin
  SetGridHeaders(ENMeasurDevChangeHeaders, sgENMeasurDevChange.ColumnHeaders);
  ColCount:=100;
  TempENMeasurDevChange :=  HTTPRIOENMeasurDevChange as ENMeasurDevChangeControllerSoapPort;

  if FilterObject = nil then
    begin
       FilterObject := ENMeasurDevChangeFilter.Create;
       SetNullIntProps(FilterObject);
       SetNullXSProps(FilterObject);
    end;

  ENMeasurDevChangeList := TempENMeasurDevChange.getScrollableFilteredList(
    ENMeasurDevChangeFilter(FilterObject), 0, ColCount);

  LastCount:=High(ENMeasurDevChangeList.list);

  if LastCount > -1 then
    sgENMeasurDevChange.RowCount := LastCount + 2
  else
    sgENMeasurDevChange.RowCount := 2;

  with sgENMeasurDevChange do
    for i := 0 to LastCount do
      begin
        Application.ProcessMessages;

        //��� �������
        if ENMeasurDevChangeList.list[i].code <> Low(Integer) then
          Cells[0,i+1] := IntToStr(ENMeasurDevChangeList.list[i].code)
        else
          Cells[0,i+1] := '';
        //�������� ������
        Cells[1,i+1] := ENMeasurDevChangeList.list[i].name;
        //�����������
        if ENMeasurDevChangeList.list[i].installDate = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDate2String(ENMeasurDevChangeList.list[i].installDate);
        //�����
        if ENMeasurDevChangeList.list[i].uninstallDate = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := XSDate2String(ENMeasurDevChangeList.list[i].uninstallDate);
        //����� ������
        Cells[4,i+1] := ENMeasurDevChangeList.list[i].workOrderNumber;
        //���� ������
        if ENMeasurDevChangeList.list[i].dateWorkOrder = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := XSDate2String(ENMeasurDevChangeList.list[i].dateWorkOrder);
        //����� ����
        Cells[6,i+1] := ENMeasurDevChangeList.list[i].actNumberGen;
        //���� ���������� ����
        if ENMeasurDevChangeList.list[i].actDateGen = nil then
          Cells[7,i+1] := ''
        else
          Cells[7,i+1] := XSDate2String(ENMeasurDevChangeList.list[i].actDateGen);
        //���������� ������
        Cells[8,i+1] := ENMeasurDevChangeList.list[i].workerEquipChange;

        //������������
        if ENMeasurDevChangeList.list[i].materialRefCode <> low(Integer)
        then
          Cells[9, i + 1] := ENMeasurDevChangeList.list[i].materialRefName
        else
          Cells[9, i + 1] := ENMeasurDevChangeList.list[i].measurDeviceRefName;
        //��� ������������
        if ENMeasurDevChangeList.list[i].measurDeviceRefCode <> low(Integer)
        then
          Cells[10, i + 1] :=
            IntToStr(ENMeasurDevChangeList.list[i].measurDeviceRefCode)
        else
          Cells[10, i + 1] := '';
        //��� �� 10 - 6 / 0,4 ��
        if ENMeasurDevChangeList.list[i].substation04RefCode <> low(Integer)
        then
          begin
            Cells[11, i + 1] :=
              IntToStr(ENMeasurDevChangeList.list[i].substation04RefCode);
            //����� ���������
            Cells[17, i + 1] :=
              ENMeasurDevChangeList.list[i].substation04RefName;
            if ENMeasurDevChangeList.list[i].substation04RefInvNumber <> ''
            then
              Cells[17, i + 1] := Cells[17, i + 1] + ', ���. � ' +
                ENMeasurDevChangeList.list[i].substation04RefInvNumber;
          end
        else
          Cells[11, i + 1] := '';

        //��� ��������������
        if ENMeasurDevChangeList.list[i].transformerRefCode <> low(Integer) then
          begin
            Cells[12, i + 1] :=
              IntToStr(ENMeasurDevChangeList.list[i].transformerRefCode);
            //����� ���������
            Cells[14, i + 1] := Cells[14, i + 1] + '. ' +
              ENMeasurDevChangeList.list[i].transformerRefName;
            if ENMeasurDevChangeList.list[i].transformerRefInvNumber <> '' then
              Cells[14, i + 1] := Cells[14, i + 1] + ', ���. � ' +
                ENMeasurDevChangeList.list[i].transformerRefInvNumber;
          end
        else
          Cells[12, i + 1] := '';

        //��� �������������� ������
        if ENMeasurDevChangeList.list[i].highVoltCellRefCode <> low(Integer)
        then
          begin
            Cells[13, i + 1] :=
              IntToStr(ENMeasurDevChangeList.list[i].highVoltCellRefCode);
            //����� ���������
            Cells[17, i + 1] := Cells[17, i + 1] + '. ������������� ����� � ' +
              ENMeasurDevChangeList.list[i].highVoltCellRefNumberGen;
          end
        else
          Cells[13, i + 1] := '';

        //��� �������������� ����
        if ENMeasurDevChangeList.list[i].lvbRefCode <> low(Integer) then
          begin
            Cells[14, i + 1] := IntToStr(ENMeasurDevChangeList.list[i].lvbRefCode);
            //����� ���������
            if ENMeasurDevChangeList.list[i].lvbRefName <> '' then
              Cells[17, i + 1] := Cells[17, i + 1] + '. ' +
                ENMeasurDevChangeList.list[i].lvbRefName;
          end //if ENMeasurDevChangeList.list[i].lvbRefCode <> low(Integer) then
        else
          Cells[14, i + 1] := '';
        //��� ������ ���
        if ENMeasurDevChangeList.list[i].pnlRefCode <> low(Integer) then
          begin
            Cells[15, i + 1] := IntToStr(ENMeasurDevChangeList.list[i].pnlRefCode);
            //����� ���������
            if ENMeasurDevChangeList.list[i].pnlRefName <> '' then
              Cells[17, i + 1] := Cells[17, i + 1] + '. ' +
                ENMeasurDevChangeList.list[i].pnlRefName;
          end //if ENMeasurDevChangeList.list[i].pnlRefCode <> low(Integer) then
        else
          Cells[15, i + 1] := '';
        //��� ���������� �������������
        if ENMeasurDevChangeList.list[i].branchRefCode <> low(Integer) then
          begin
            Cells[16, i + 1] := IntToStr(ENMeasurDevChangeList.list[i].branchRefCode);
            //����� ���������
            if ENMeasurDevChangeList.list[i].branchRefNumberGen <> '' then
              Cells[17, i + 1] := Cells[17, i + 1] + '. ' +
                ENMeasurDevChangeList.list[i].branchRefNumberGen;
            if ENMeasurDevChangeList.list[i].branchRefName <> '' then
              Cells[17, i + 1] := Cells[17, i + 1] + '. ' +
                ENMeasurDevChangeList.list[i].branchRefName;
          end //if ENMeasurDevChangeList.list[i].branchRefCode <> low(Integer) then
        else
          Cells[16, i + 1] := '';

        LastRow := i + 1;
        sgENMeasurDevChange.RowCount := LastRow + 1;
      end;
   ColCount := ColCount + 1;
   sgENMeasurDevChange.Row := 1;
end;

procedure TfrmENMeasurDevChangeShow.sgENMeasurDevChangeTopLeftChanged(Sender: TObject);
var TempENMeasurDevChange: ENMeasurDevChangeControllerSoapPort;
  i, CurrentRow: Integer;
  ENMeasurDevChangeList: ENMeasurDevChangeShortList;
begin
  if LastCount < 99 then Exit;
  if (sgENMeasurDevChange.TopRow + sgENMeasurDevChange.VisibleRowCount) = ColCount
  then
    begin
      TempENMeasurDevChange :=  HTTPRIOENMeasurDevChange as ENMeasurDevChangeControllerSoapPort;
      CurrentRow:=sgENMeasurDevChange.RowCount;

      if FilterObject = nil then
        begin
          FilterObject := ENMeasurDevChangeFilter.Create;
          SetNullIntProps(FilterObject);
          SetNullXSProps(FilterObject);
        end;

      ENMeasurDevChangeList := TempENMeasurDevChange.getScrollableFilteredList(
        ENMeasurDevChangeFilter(FilterObject), ColCount - 1, 100);

      sgENMeasurDevChange.RowCount := sgENMeasurDevChange.RowCount + 100;
      LastCount := High(ENMeasurDevChangeList.list);
      with sgENMeasurDevChange do
        for i := 0 to LastCount do
          begin
            Application.ProcessMessages;

            //��� �������
            if ENMeasurDevChangeList.list[i].code <> Low(Integer) then
              Cells[0, i + CurrentRow] := IntToStr(ENMeasurDevChangeList.list[i].code)
            else
              Cells[0, i + CurrentRow] := '';
            //�������� ������
            Cells[1, i + CurrentRow] := ENMeasurDevChangeList.list[i].name;
            //�����������
            if ENMeasurDevChangeList.list[i].installDate = nil then
              Cells[2, i + CurrentRow] := ''
            else
              Cells[2, i + CurrentRow] := XSDate2String(ENMeasurDevChangeList.list[i].installDate);
            //�����
            if ENMeasurDevChangeList.list[i].uninstallDate = nil then
              Cells[3, i + CurrentRow] := ''
            else
              Cells[3, i + CurrentRow] := XSDate2String(ENMeasurDevChangeList.list[i].uninstallDate);
            //����� ������
            Cells[4, i + CurrentRow] := ENMeasurDevChangeList.list[i].workOrderNumber;
            //���� ������
            if ENMeasurDevChangeList.list[i].dateWorkOrder = nil then
              Cells[5, i + CurrentRow] := ''
            else
              Cells[5, i + CurrentRow] := XSDate2String(ENMeasurDevChangeList.list[i].dateWorkOrder);
            //����� ����
            Cells[6, i + CurrentRow] := ENMeasurDevChangeList.list[i].actNumberGen;
            //���� ���������� ����
            if ENMeasurDevChangeList.list[i].actDateGen = nil then
              Cells[7, i + CurrentRow] := ''
            else
              Cells[7, i + CurrentRow] := XSDate2String(ENMeasurDevChangeList.list[i].actDateGen);
            //���������� ������
            Cells[8, i + CurrentRow] := ENMeasurDevChangeList.list[i].workerEquipChange;

            //������������
            if ENMeasurDevChangeList.list[i].materialRefCode <> low(Integer)
            then
              Cells[9, i + CurrentRow] :=
                ENMeasurDevChangeList.list[i].materialRefName
            else
              Cells[9, i + CurrentRow] :=
                ENMeasurDevChangeList.list[i].measurDeviceRefName;
            //��� ������������
            if ENMeasurDevChangeList.list[i].measurDeviceRefCode <> low(Integer)
            then
              Cells[10, i + CurrentRow] :=
                IntToStr(ENMeasurDevChangeList.list[i].measurDeviceRefCode)
            else
              Cells[10, i + CurrentRow] := '';
            //��� �� 10 - 6 / 0,4 ��
            if ENMeasurDevChangeList.list[i].substation04RefCode <> low(Integer)
            then
              begin
                Cells[11, i + CurrentRow] :=
                  IntToStr(ENMeasurDevChangeList.list[i].substation04RefCode);
                //����� ���������
                Cells[17, i + CurrentRow] :=
                  ENMeasurDevChangeList.list[i].substation04RefName;
                if ENMeasurDevChangeList.list[i].substation04RefInvNumber <> ''
                then
                  Cells[17, i + CurrentRow] := Cells[17, i + CurrentRow] + ', ���. � ' +
                    ENMeasurDevChangeList.list[i].substation04RefInvNumber;
              end
            else
              Cells[11, i + CurrentRow] := '';
            //��� ��������������
            Cells[12, i + CurrentRow] := '';
            //��� �������������� ������
            if ENMeasurDevChangeList.list[i].highVoltCellRefCode <> low(Integer)
            then
              begin
                Cells[13, i + CurrentRow] :=
                  IntToStr(ENMeasurDevChangeList.list[i].highVoltCellRefCode);
                //����� ���������
                Cells[17, i + CurrentRow] := Cells[17, i + CurrentRow] + '. ������������� ����� � ' +
                  ENMeasurDevChangeList.list[i].highVoltCellRefNumberGen;
              end
            else
              Cells[13, i + CurrentRow] := '';

            //��� �������������� ����
            if ENMeasurDevChangeList.list[i].lvbRefCode <> low(Integer) then
              begin
                Cells[14, i + CurrentRow] := IntToStr(ENMeasurDevChangeList.list[i].lvbRefCode);
                //����� ���������
                if ENMeasurDevChangeList.list[i].lvbRefName <> '' then
                  Cells[17, i + CurrentRow] := Cells[17, i + CurrentRow] + '. ' +
                    ENMeasurDevChangeList.list[i].lvbRefName;
              end //if ENMeasurDevChangeList.list[i].lvbRefCode <> low(Integer) then
            else
              Cells[14, i + CurrentRow] := '';
            //��� ������ ���
            if ENMeasurDevChangeList.list[i].pnlRefCode <> low(Integer) then
              begin
                Cells[15, i + CurrentRow] := IntToStr(ENMeasurDevChangeList.list[i].pnlRefCode);
                //����� ���������
                if ENMeasurDevChangeList.list[i].pnlRefName <> '' then
                  Cells[17, i + CurrentRow] := Cells[17, i + CurrentRow] + '. ' +
                    ENMeasurDevChangeList.list[i].pnlRefName;
              end //if ENMeasurDevChangeList.list[i].pnlRefCode <> low(Integer) then
            else
              Cells[15, i + CurrentRow] := '';
            //��� ���������� �������������
            if ENMeasurDevChangeList.list[i].branchRefCode <> low(Integer) then
              begin
                Cells[16, i + CurrentRow] := IntToStr(ENMeasurDevChangeList.list[i].branchRefCode);
                //����� ���������
                if ENMeasurDevChangeList.list[i].branchRefNumberGen <> '' then
                  Cells[17, i + CurrentRow] := Cells[17, i + CurrentRow] + '. ' +
                    ENMeasurDevChangeList.list[i].branchRefNumberGen;
                if ENMeasurDevChangeList.list[i].branchRefName <> '' then
                  Cells[17, i + CurrentRow] := Cells[17, i + CurrentRow] + '. ' +
                    ENMeasurDevChangeList.list[i].branchRefName;
              end //if ENMeasurDevChangeList.list[i].branchRefCode <> low(Integer) then
            else
              Cells[16, i + CurrentRow] := '';

            LastRow := i + CurrentRow;
          end;
       ColCount := ColCount + 100;
       sgENMeasurDevChange.Row := CurrentRow - 5;
       sgENMeasurDevChange.RowCount := LastRow + 1;
    end;
end;

procedure TfrmENMeasurDevChangeShow.sgENMeasurDevChangeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENMeasurDevChange,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENMeasurDevChangeShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENMeasurDevChange.RowCount-1 do
   for j:=0 to sgENMeasurDevChange.ColCount-1 do
     sgENMeasurDevChange.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENMeasurDevChangeShow.actViewExecute(Sender: TObject);
Var TempENMeasurDevChange: ENMeasurDevChangeControllerSoapPort;
begin
 TempENMeasurDevChange := HTTPRIOENMeasurDevChange as ENMeasurDevChangeControllerSoapPort;
   try
     ENMeasurDevChangeObj := TempENMeasurDevChange.getObject(StrToInt(sgENMeasurDevChange.Cells[0,sgENMeasurDevChange.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENMeasurDevChangeEdit:=TfrmENMeasurDevChangeEdit.Create(Application, dsView);
  try
    frmENMeasurDevChangeEdit.ShowModal;
  finally
    frmENMeasurDevChangeEdit.Free;
    frmENMeasurDevChangeEdit:=nil;
  end;
end;

procedure TfrmENMeasurDevChangeShow.actEditExecute(Sender: TObject);
Var TempENMeasurDevChange: ENMeasurDevChangeControllerSoapPort;
begin
 TempENMeasurDevChange := HTTPRIOENMeasurDevChange as ENMeasurDevChangeControllerSoapPort;
   try
     ENMeasurDevChangeObj := TempENMeasurDevChange.getObject(StrToInt(sgENMeasurDevChange.Cells[0,sgENMeasurDevChange.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENMeasurDevChangeEdit:=TfrmENMeasurDevChangeEdit.Create(Application, dsEdit);
  try
    if frmENMeasurDevChangeEdit.ShowModal= mrOk then
      begin
        //TempENMeasurDevChange.save(ENMeasurDevChangeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENMeasurDevChangeEdit.Free;
    frmENMeasurDevChangeEdit:=nil;
  end;
end;

procedure TfrmENMeasurDevChangeShow.actDeleteExecute(Sender: TObject);
Var TempENMeasurDevChange: ENMeasurDevChangeControllerSoapPort;
  ObjCode: Integer;
begin
 TempENMeasurDevChange := HTTPRIOENMeasurDevChange as ENMeasurDevChangeControllerSoapPort;
   try
     ObjCode := StrToInt(sgENMeasurDevChange.Cells[0,sgENMeasurDevChange.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('�� ������������� ������ ������� (������ ������������� ��������) ?'),
                    PChar('�������� !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENMeasurDevChange.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENMeasurDevChangeShow.actInsertExecute(Sender: TObject);
Var TempENMeasurDevChange: ENMeasurDevChangeControllerSoapPort;
begin
  TempENMeasurDevChange := HTTPRIOENMeasurDevChange as ENMeasurDevChangeControllerSoapPort;
  ENMeasurDevChangeObj:=ENMeasurDevChange.Create;

   //ENMeasurDevChangeObj.installDate:= TXSDate.Create;
   //ENMeasurDevChangeObj.uninstallDate:= TXSDate.Create;
   //ENMeasurDevChangeObj.dateWorkOrder:= TXSDate.Create;
   //ENMeasurDevChangeObj.actDateGen:= TXSDate.Create;


  try
    frmENMeasurDevChangeEdit:=TfrmENMeasurDevChangeEdit.Create(Application, dsInsert);
    try
      if frmENMeasurDevChangeEdit.ShowModal = mrOk then
      begin
        if ENMeasurDevChangeObj<>nil then
            //TempENMeasurDevChange.add(ENMeasurDevChangeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENMeasurDevChangeEdit.Free;
      frmENMeasurDevChangeEdit:=nil;
    end;
  finally
    ENMeasurDevChangeObj.Free;
  end;
end;

procedure TfrmENMeasurDevChangeShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENMeasurDevChangeShow.actFilterExecute(Sender: TObject);
begin
{frmENMeasurDevChangeFilterEdit:=TfrmENMeasurDevChangeFilterEdit.Create(Application, dsInsert);
  try
    ENMeasurDevChangeFilterObj := ENMeasurDevChangeFilter.Create;
    SetNullIntProps(ENMeasurDevChangeFilterObj);
    SetNullXSProps(ENMeasurDevChangeFilterObj);

    if frmENMeasurDevChangeFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENMeasurDevChangeFilter.Create;
      FilterObject := ENMeasurDevChangeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENMeasurDevChangeFilterEdit.Free;
    frmENMeasurDevChangeFilterEdit:=nil;
  end;}
end;

procedure TfrmENMeasurDevChangeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.