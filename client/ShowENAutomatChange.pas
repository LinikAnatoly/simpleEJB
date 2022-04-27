//������� ����� �������������� ������������
unit ShowENAutomatChange;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENAutomatChangeController, AdvObj ;


type
  TfrmENAutomatChangeShow = class(TChildForm)  
  HTTPRIOENAutomatChange: THTTPRIO;
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
    sgENAutomatChange: TAdvStringGrid;

procedure FormShow(Sender: TObject);
procedure FormClose(Sender: TObject; var Action: TCloseAction);
procedure sgENAutomatChangeTopLeftChanged(Sender: TObject);
procedure sgENAutomatChangeDblClick(Sender: TObject);
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
 frmENAutomatChangeShow : TfrmENAutomatChangeShow;
 // ENAutomatChangeObj: ENAutomatChange;
 // ENAutomatChangeFilterObj: ENAutomatChangeFilter;
  
  
implementation

uses Main, EditENAutomatChange, EditENAutomatChangeFilter;


{$R *.dfm}

var
  //frmENAutomatChangeShow : TfrmENAutomatChangeShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENAutomatChangeHeaders: array [1..17] of String =
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
          ,'��� �������������� ����'
          ,'��� ������ ���'
          ,'��� ���������� �������������'
          ,'����� ���������'
        );
   

procedure TfrmENAutomatChangeShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENAutomatChangeShow:=nil;
    inherited;
  end;


procedure TfrmENAutomatChangeShow.FormShow(Sender: TObject);
var TempENAutomatChange: ENAutomatChangeControllerSoapPort;
  i: Integer;
  ENAutomatChangeList: ENAutomatChangeShortList;
begin
  SetGridHeaders(ENAutomatChangeHeaders, sgENAutomatChange.ColumnHeaders);
  ColCount:=100;
  TempENAutomatChange :=  HTTPRIOENAutomatChange as ENAutomatChangeControllerSoapPort;

  if FilterObject = nil then
    begin
      FilterObject := ENAutomatChangeFilter.Create;
      SetNullIntProps(FilterObject);
      SetNullXSProps(FilterObject);
    end;

  ENAutomatChangeList := TempENAutomatChange.getScrollableFilteredList(
    ENAutomatChangeFilter(FilterObject), 0, ColCount);

  LastCount:=High(ENAutomatChangeList.list);

  if LastCount > -1 then
    sgENAutomatChange.RowCount := LastCount + 2
  else
    sgENAutomatChange.RowCount := 2;

  with sgENAutomatChange do
    for i := 0 to LastCount do
      begin
        Application.ProcessMessages;

        //��� �������
        if ENAutomatChangeList.list[i].code <> Low(Integer) then
          Cells[0,i+1] := IntToStr(ENAutomatChangeList.list[i].code)
        else
          Cells[0,i+1] := '';
        //�������� ������
        Cells[1,i+1] := ENAutomatChangeList.list[i].name;
        //�����������
        if ENAutomatChangeList.list[i].installDate = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDate2String(ENAutomatChangeList.list[i].installDate);
        //�����
        if ENAutomatChangeList.list[i].uninstallDate = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := XSDate2String(ENAutomatChangeList.list[i].uninstallDate);
        //����� ������
        Cells[4,i+1] := ENAutomatChangeList.list[i].workOrderNumber;
        //���� ������
        if ENAutomatChangeList.list[i].dateWorkOrder = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := XSDate2String(ENAutomatChangeList.list[i].dateWorkOrder);
        //����� ����
        Cells[6,i+1] := ENAutomatChangeList.list[i].actNumberGen;
        //���� ���������� ����
        if ENAutomatChangeList.list[i].actDateGen = nil then
          Cells[7,i+1] := ''
        else
          Cells[7,i+1] := XSDate2String(ENAutomatChangeList.list[i].actDateGen);
        //���������� ������
        Cells[8,i+1] := ENAutomatChangeList.list[i].workerEquipChange;

        //������������
        if ENAutomatChangeList.list[i].materialRefCode <> low(Integer)
        then
          Cells[9, i + 1] := ENAutomatChangeList.list[i].materialRefName
        else
          Cells[9, i + 1] := ENAutomatChangeList.list[i].AutomatRefName;
        //��� ������������
        if ENAutomatChangeList.list[i].AutomatRefCode <> low(Integer)
        then
          Cells[10, i + 1] :=
            IntToStr(ENAutomatChangeList.list[i].AutomatRefCode)
        else
          Cells[10, i + 1] := '';
        //��� �� 10 - 6 / 0,4 ��
        if ENAutomatChangeList.list[i].substation04RefCode <> low(Integer)
        then
          begin
            Cells[11, i + 1] :=
              IntToStr(ENAutomatChangeList.list[i].substation04RefCode);
            //����� ���������
            Cells[17, i + 1] :=
              ENAutomatChangeList.list[i].substation04RefName;
            if ENAutomatChangeList.list[i].substation04RefInvNumber <> ''
            then
              Cells[17, i + 1] := Cells[17, i + 1] + ', ���. � ' +
                ENAutomatChangeList.list[i].substation04RefInvNumber;
          end
        else
          Cells[11, i + 1] := '';
        //��� ��������������
        if ENAutomatChangeList.list[i].transformerRefCode <> low(Integer) then
          begin
            Cells[12, i + 1] :=
              IntToStr(ENAutomatChangeList.list[i].transformerRefCode);
            //����� ���������
            Cells[14, i + 1] := Cells[14, i + 1] + '. ' +
              ENAutomatChangeList.list[i].transformerRefName;
            if ENAutomatChangeList.list[i].transformerRefInvNumber <> '' then
              Cells[14, i + 1] := Cells[14, i + 1] + ', ���. � ' +
                ENAutomatChangeList.list[i].transformerRefInvNumber;
          end
        else
          Cells[12, i + 1] := '';

        //��� �������������� ����
        if ENAutomatChangeList.list[i].lvbRefCode <> low(Integer) then
          begin
            Cells[13, i + 1] := IntToStr(ENAutomatChangeList.list[i].lvbRefCode);
            //����� ���������
            if ENAutomatChangeList.list[i].lvbRefName <> '' then
              Cells[16, i + 1] := Cells[16, i + 1] + '. ' +
                ENAutomatChangeList.list[i].lvbRefName;
          end //if ENAutomatChangeList.list[i].lvbRefCode <> low(Integer) then
        else
          Cells[16, i + 1] := '';
        //��� ������ ���
        if ENAutomatChangeList.list[i].pnlRefCode <> low(Integer) then
          begin
            Cells[14, i + 1] := IntToStr(ENAutomatChangeList.list[i].pnlRefCode);
            //����� ���������
            if ENAutomatChangeList.list[i].pnlRefName <> '' then
              Cells[16, i + 1] := Cells[16, i + 1] + '. ' +
                ENAutomatChangeList.list[i].pnlRefName;
          end //if ENAutomatChangeList.list[i].pnlRefCode <> low(Integer) then
        else
          Cells[14, i + 1] := '';
        //��� ���������� �������������
        if ENAutomatChangeList.list[i].branchRefCode <> low(Integer) then
          begin
            Cells[15, i + 1] := IntToStr(ENAutomatChangeList.list[i].branchRefCode);
            //����� ���������
            if ENAutomatChangeList.list[i].branchRefNumberGen <> '' then
              Cells[16, i + 1] := Cells[16, i + 1] + '. ' +
                ENAutomatChangeList.list[i].branchRefNumberGen;
            if ENAutomatChangeList.list[i].branchRefName <> '' then
              Cells[16, i + 1] := Cells[16, i + 1] + '. ' +
                ENAutomatChangeList.list[i].branchRefName;
          end //if ENAutomatChangeList.list[i].branchRefCode <> low(Integer) then
        else
          Cells[15, i + 1] := '';

        LastRow := i + 1;
        sgENAutomatChange.RowCount := LastRow + 1;
      end;
   ColCount := ColCount + 1;
   sgENAutomatChange.Row := 1;
end;

procedure TfrmENAutomatChangeShow.sgENAutomatChangeTopLeftChanged(Sender: TObject);
var TempENAutomatChange: ENAutomatChangeControllerSoapPort;
  i, CurrentRow: Integer;
  ENAutomatChangeList: ENAutomatChangeShortList;
begin
  if LastCount < 99 then Exit;
  if (sgENAutomatChange.TopRow + sgENAutomatChange.VisibleRowCount) = ColCount
  then
    begin
      TempENAutomatChange :=
        HTTPRIOENAutomatChange as ENAutomatChangeControllerSoapPort;
      CurrentRow:=sgENAutomatChange.RowCount;

      if FilterObject = nil then
        begin
          FilterObject := ENAutomatChangeFilter.Create;
          SetNullIntProps(FilterObject);
          SetNullXSProps(FilterObject);
        end;

      ENAutomatChangeList := TempENAutomatChange.getScrollableFilteredList(
        ENAutomatChangeFilter(FilterObject), ColCount - 1, 100);

      sgENAutomatChange.RowCount := sgENAutomatChange.RowCount + 100;
      LastCount := High(ENAutomatChangeList.list);
      with sgENAutomatChange do
        for i := 0 to LastCount do
          begin
            Application.ProcessMessages;

            //��� �������
            if ENAutomatChangeList.list[i].code <> Low(Integer) then
              Cells[0, i + CurrentRow] := IntToStr(ENAutomatChangeList.list[i].code)
            else
              Cells[0, i + CurrentRow] := '';
            //�������� ������
            Cells[1, i + CurrentRow] := ENAutomatChangeList.list[i].name;
            //�����������
            if ENAutomatChangeList.list[i].installDate = nil then
              Cells[2, i + CurrentRow] := ''
            else
              Cells[2, i + CurrentRow] := XSDate2String(ENAutomatChangeList.list[i].installDate);
            //�����
            if ENAutomatChangeList.list[i].uninstallDate = nil then
              Cells[3, i + CurrentRow] := ''
            else
              Cells[3, i + CurrentRow] := XSDate2String(ENAutomatChangeList.list[i].uninstallDate);
            //����� ������
            Cells[4, i + CurrentRow] := ENAutomatChangeList.list[i].workOrderNumber;
            //���� ������
            if ENAutomatChangeList.list[i].dateWorkOrder = nil then
              Cells[5, i + CurrentRow] := ''
            else
              Cells[5, i + CurrentRow] := XSDate2String(ENAutomatChangeList.list[i].dateWorkOrder);
            //����� ����
            Cells[6, i + CurrentRow] := ENAutomatChangeList.list[i].actNumberGen;
            //���� ���������� ����
            if ENAutomatChangeList.list[i].actDateGen = nil then
              Cells[7, i + CurrentRow] := ''
            else
              Cells[7, i + CurrentRow] := XSDate2String(ENAutomatChangeList.list[i].actDateGen);
            //���������� ������
            Cells[8, i + CurrentRow] := ENAutomatChangeList.list[i].workerEquipChange;

            //������������
            if ENAutomatChangeList.list[i].materialRefCode <> low(Integer)
            then
              Cells[9, i + CurrentRow] :=
                ENAutomatChangeList.list[i].materialRefName
            else
              Cells[9, i + CurrentRow] := ENAutomatChangeList.list[i].AutomatRefName;
            //��� ������������
            if ENAutomatChangeList.list[i].AutomatRefCode <> low(Integer)
            then
              Cells[10, i + CurrentRow] :=
                IntToStr(ENAutomatChangeList.list[i].AutomatRefCode)
            else
              Cells[10, i + CurrentRow] := '';
            //��� �� 10 - 6 / 0,4 ��
            if ENAutomatChangeList.list[i].substation04RefCode <> low(Integer)
            then
              begin
                Cells[11, i + CurrentRow] :=
                  IntToStr(ENAutomatChangeList.list[i].substation04RefCode);
                //����� ���������
                Cells[17, i + CurrentRow] :=
                  ENAutomatChangeList.list[i].substation04RefName;
                if ENAutomatChangeList.list[i].substation04RefInvNumber <> ''
                then
                  Cells[17, i + CurrentRow] := Cells[17, i + CurrentRow] + ', ���. � ' +
                    ENAutomatChangeList.list[i].substation04RefInvNumber;
              end
            else
              Cells[11, i + CurrentRow] := '';
            //��� ��������������
            Cells[12, i + CurrentRow] := '';

            //��� �������������� ����
            if ENAutomatChangeList.list[i].lvbRefCode <> low(Integer) then
              begin
                Cells[13, i + CurrentRow] := IntToStr(ENAutomatChangeList.list[i].lvbRefCode);
                //����� ���������
                if ENAutomatChangeList.list[i].lvbRefName <> '' then
                  Cells[16, i + CurrentRow] := Cells[16, i + CurrentRow] + '. ' +
                    ENAutomatChangeList.list[i].lvbRefName;
              end //if ENAutomatChangeList.list[i].lvbRefCode <> low(Integer) then
            else
              Cells[16, i + CurrentRow] := '';
            //��� ������ ���
            if ENAutomatChangeList.list[i].pnlRefCode <> low(Integer) then
              begin
                Cells[14, i + CurrentRow] := IntToStr(ENAutomatChangeList.list[i].pnlRefCode);
                //����� ���������
                if ENAutomatChangeList.list[i].pnlRefName <> '' then
                  Cells[16, i + CurrentRow] := Cells[16, i + CurrentRow] + '. ' +
                    ENAutomatChangeList.list[i].pnlRefName;
              end //if ENAutomatChangeList.list[i].pnlRefCode <> low(Integer) then
            else
              Cells[14, i + CurrentRow] := '';
            //��� ���������� �������������
            if ENAutomatChangeList.list[i].branchRefCode <> low(Integer) then
              begin
                Cells[15, i + CurrentRow] := IntToStr(ENAutomatChangeList.list[i].branchRefCode);
                //����� ���������
                if ENAutomatChangeList.list[i].branchRefNumberGen <> '' then
                  Cells[16, i + CurrentRow] := Cells[16, i + CurrentRow] + '. ' +
                    ENAutomatChangeList.list[i].branchRefNumberGen;
                if ENAutomatChangeList.list[i].branchRefName <> '' then
                  Cells[16, i + CurrentRow] := Cells[16, i + CurrentRow] + '. ' +
                    ENAutomatChangeList.list[i].branchRefName;
              end //if ENAutomatChangeList.list[i].branchRefCode <> low(Integer) then
            else
              Cells[15, i + CurrentRow] := '';

            LastRow := i + CurrentRow;
          end;
       ColCount := ColCount + 100;
       sgENAutomatChange.Row := CurrentRow - 5;
       sgENAutomatChange.RowCount := LastRow + 1;
    end;
end;

procedure TfrmENAutomatChangeShow.sgENAutomatChangeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENAutomatChange,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENAutomatChangeShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENAutomatChange.RowCount-1 do
   for j:=0 to sgENAutomatChange.ColCount-1 do
     sgENAutomatChange.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENAutomatChangeShow.actViewExecute(Sender: TObject);
Var TempENAutomatChange: ENAutomatChangeControllerSoapPort;
begin
 TempENAutomatChange := HTTPRIOENAutomatChange as ENAutomatChangeControllerSoapPort;
   try
     ENAutomatChangeObj := TempENAutomatChange.getObject(StrToInt(sgENAutomatChange.Cells[0,sgENAutomatChange.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENAutomatChangeEdit:=TfrmENAutomatChangeEdit.Create(Application, dsView);
  try
    frmENAutomatChangeEdit.ShowModal;
  finally
    frmENAutomatChangeEdit.Free;
    frmENAutomatChangeEdit:=nil;
  end;
end;

procedure TfrmENAutomatChangeShow.actEditExecute(Sender: TObject);
Var TempENAutomatChange: ENAutomatChangeControllerSoapPort;
begin
 TempENAutomatChange := HTTPRIOENAutomatChange as ENAutomatChangeControllerSoapPort;
   try
     ENAutomatChangeObj := TempENAutomatChange.getObject(StrToInt(sgENAutomatChange.Cells[0,sgENAutomatChange.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENAutomatChangeEdit:=TfrmENAutomatChangeEdit.Create(Application, dsEdit);
  try
    if frmENAutomatChangeEdit.ShowModal= mrOk then
      begin
        //TempENAutomatChange.save(ENAutomatChangeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENAutomatChangeEdit.Free;
    frmENAutomatChangeEdit:=nil;
  end;
end;

procedure TfrmENAutomatChangeShow.actDeleteExecute(Sender: TObject);
Var TempENAutomatChange: ENAutomatChangeControllerSoapPort;
  ObjCode: Integer;
begin
 TempENAutomatChange := HTTPRIOENAutomatChange as ENAutomatChangeControllerSoapPort;
   try
     ObjCode := StrToInt(sgENAutomatChange.Cells[0,sgENAutomatChange.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('�� ������������� ������ ������� (������ �������������� ������������) ?'),
                    PChar('�������� !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENAutomatChange.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENAutomatChangeShow.actInsertExecute(Sender: TObject);
Var TempENAutomatChange: ENAutomatChangeControllerSoapPort;
begin
  TempENAutomatChange := HTTPRIOENAutomatChange as ENAutomatChangeControllerSoapPort;
  ENAutomatChangeObj:=ENAutomatChange.Create;

   //ENAutomatChangeObj.installDate:= TXSDate.Create;
   //ENAutomatChangeObj.uninstallDate:= TXSDate.Create;
   //ENAutomatChangeObj.dateWorkOrder:= TXSDate.Create;
   //ENAutomatChangeObj.actDateGen:= TXSDate.Create;


  try
    frmENAutomatChangeEdit:=TfrmENAutomatChangeEdit.Create(Application, dsInsert);
    try
      if frmENAutomatChangeEdit.ShowModal = mrOk then
      begin
        if ENAutomatChangeObj<>nil then
            //TempENAutomatChange.add(ENAutomatChangeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENAutomatChangeEdit.Free;
      frmENAutomatChangeEdit:=nil;
    end;
  finally
    ENAutomatChangeObj.Free;
  end;
end;

procedure TfrmENAutomatChangeShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENAutomatChangeShow.actFilterExecute(Sender: TObject);
begin
{frmENAutomatChangeFilterEdit:=TfrmENAutomatChangeFilterEdit.Create(Application, dsInsert);
  try
    ENAutomatChangeFilterObj := ENAutomatChangeFilter.Create;
    SetNullIntProps(ENAutomatChangeFilterObj);
    SetNullXSProps(ENAutomatChangeFilterObj);

    if frmENAutomatChangeFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENAutomatChangeFilter.Create;
      FilterObject := ENAutomatChangeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENAutomatChangeFilterEdit.Free;
    frmENAutomatChangeFilterEdit:=nil;
  end;}
end;

procedure TfrmENAutomatChangeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.