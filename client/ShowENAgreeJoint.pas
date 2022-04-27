
unit ShowENAgreeJoint;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENAgreeJointController ;


type
  TfrmENAgreeJointShow = class(TChildForm)  
  HTTPRIOENAgreeJoint: THTTPRIO;
    ImageList1: TImageList;
    sgENAgreeJoint: TAdvStringGrid;
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

procedure FormShow(Sender: TObject);
procedure FormClose(Sender: TObject; var Action: TCloseAction);
procedure sgENAgreeJointTopLeftChanged(Sender: TObject);
procedure sgENAgreeJointDblClick(Sender: TObject);
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

//var
 // ENAgreeJointObj: ENAgreeJoint;
 // ENAgreeJointFilterObj: ENAgreeJointFilter;
  
  
implementation

uses Main, EditENAgreeJoint, EditENAgreeJointFilter;


{$R *.dfm}

var
  //frmENAgreeJointShow : TfrmENAgreeJointShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENAgreeJointHeaders: array [1..5] of String =
        ( 'Код'
          ,'Собственник линии'
          ,'Номер договора СИЭ'
          ,'Дата оформления договора СИЭ'
          ,'Предел балансовой принадлежности'
        );
   

procedure TfrmENAgreeJointShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENAgreeJointShow:=nil;
    inherited;
  end;


procedure TfrmENAgreeJointShow.FormShow(Sender: TObject);
var
  TempENAgreeJoint: ENAgreeJointControllerSoapPort;
  i: Integer;
  ENAgreeJointList: ENAgreeJointShortList;
  begin
  SetGridHeaders(ENAgreeJointHeaders, sgENAgreeJoint.ColumnHeaders);
  ColCount:=100;
  TempENAgreeJoint :=  HTTPRIOENAgreeJoint as ENAgreeJointControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENAgreeJointFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENAgreeJointList := TempENAgreeJoint.getScrollableFilteredList(ENAgreeJointFilter(FilterObject),0,ColCount);


  LastCount:=High(ENAgreeJointList.list);

  if LastCount > -1 then
     sgENAgreeJoint.RowCount:=LastCount+2
  else
     sgENAgreeJoint.RowCount:=2;

   with sgENAgreeJoint do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENAgreeJointList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENAgreeJointList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENAgreeJointList.list[i].name;
        Cells[2,i+1] := ENAgreeJointList.list[i].agreeNum;
        if ENAgreeJointList.list[i].agreeDate = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := XSDate2String(ENAgreeJointList.list[i].agreeDate);
        Cells[4,i+1] := ENAgreeJointList.list[i].balanceLim;
        LastRow:=i+1;
        sgENAgreeJoint.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENAgreeJoint.Row:=1;
end;

procedure TfrmENAgreeJointShow.sgENAgreeJointTopLeftChanged(Sender: TObject);
var
  TempENAgreeJoint: ENAgreeJointControllerSoapPort;
  i,CurrentRow: Integer;
  ENAgreeJointList: ENAgreeJointShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENAgreeJoint.TopRow + sgENAgreeJoint.VisibleRowCount) = ColCount
  then
    begin
      TempENAgreeJoint :=  HTTPRIOENAgreeJoint as ENAgreeJointControllerSoapPort;
      CurrentRow:=sgENAgreeJoint.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENAgreeJointFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENAgreeJointList := TempENAgreeJoint.getScrollableFilteredList(ENAgreeJointFilter(FilterObject),ColCount-1, 100);



  sgENAgreeJoint.RowCount:=sgENAgreeJoint.RowCount+100;
  LastCount:=High(ENAgreeJointList.list);
  with sgENAgreeJoint do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENAgreeJointList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENAgreeJointList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENAgreeJointList.list[i].name;
        Cells[2,i+CurrentRow] := ENAgreeJointList.list[i].agreeNum;
        if ENAgreeJointList.list[i].agreeDate = nil then
          Cells[3,i+CurrentRow] := ''
        else
          Cells[3,i+CurrentRow] := XSDate2String(ENAgreeJointList.list[i].agreeDate);
        Cells[4,i+CurrentRow] := ENAgreeJointList.list[i].balanceLim;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENAgreeJoint.Row:=CurrentRow-5;
   sgENAgreeJoint.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENAgreeJointShow.sgENAgreeJointDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENAgreeJoint,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENAgreeJointShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENAgreeJoint.RowCount-1 do
   for j:=0 to sgENAgreeJoint.ColCount-1 do
     sgENAgreeJoint.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENAgreeJointShow.actViewExecute(Sender: TObject);
Var TempENAgreeJoint: ENAgreeJointControllerSoapPort;
begin
 TempENAgreeJoint := HTTPRIOENAgreeJoint as ENAgreeJointControllerSoapPort;
   try
     ENAgreeJointObj := TempENAgreeJoint.getObject(StrToInt(sgENAgreeJoint.Cells[0,sgENAgreeJoint.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENAgreeJointEdit:=TfrmENAgreeJointEdit.Create(Application, dsView);
  try
    frmENAgreeJointEdit.ShowModal;
  finally
    frmENAgreeJointEdit.Free;
    frmENAgreeJointEdit:=nil;
  end;
end;

procedure TfrmENAgreeJointShow.actEditExecute(Sender: TObject);
Var TempENAgreeJoint: ENAgreeJointControllerSoapPort;
begin
 TempENAgreeJoint := HTTPRIOENAgreeJoint as ENAgreeJointControllerSoapPort;
   try
     ENAgreeJointObj := TempENAgreeJoint.getObject(StrToInt(sgENAgreeJoint.Cells[0,sgENAgreeJoint.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENAgreeJointEdit:=TfrmENAgreeJointEdit.Create(Application, dsEdit);
  try
    if frmENAgreeJointEdit.ShowModal= mrOk then
      begin
        //TempENAgreeJoint.save(ENAgreeJointObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENAgreeJointEdit.Free;
    frmENAgreeJointEdit:=nil;
  end;
end;

procedure TfrmENAgreeJointShow.actDeleteExecute(Sender: TObject);
Var TempENAgreeJoint: ENAgreeJointControllerSoapPort;
  ObjCode: Integer;
begin
 TempENAgreeJoint := HTTPRIOENAgreeJoint as ENAgreeJointControllerSoapPort;
   try
     ObjCode := StrToInt(sgENAgreeJoint.Cells[0,sgENAgreeJoint.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Договора о Совместном Использовании Электросетей) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENAgreeJoint.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENAgreeJointShow.actInsertExecute(Sender: TObject);
Var TempENAgreeJoint: ENAgreeJointControllerSoapPort;
begin
  TempENAgreeJoint := HTTPRIOENAgreeJoint as ENAgreeJointControllerSoapPort;
  ENAgreeJointObj:=ENAgreeJoint.Create;

   //ENAgreeJointObj.agreeDate:= TXSDate.Create;


  try
    frmENAgreeJointEdit:=TfrmENAgreeJointEdit.Create(Application, dsInsert);
    try
      if frmENAgreeJointEdit.ShowModal = mrOk then
      begin
        if ENAgreeJointObj<>nil then
            //TempENAgreeJoint.add(ENAgreeJointObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENAgreeJointEdit.Free;
      frmENAgreeJointEdit:=nil;
    end;
  finally
    ENAgreeJointObj.Free;
  end;
end;

procedure TfrmENAgreeJointShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENAgreeJointShow.actFilterExecute(Sender: TObject);
begin
{frmENAgreeJointFilterEdit:=TfrmENAgreeJointFilterEdit.Create(Application, dsInsert);
  try
    ENAgreeJointFilterObj := ENAgreeJointFilter.Create;
    SetNullIntProps(ENAgreeJointFilterObj);
    SetNullXSProps(ENAgreeJointFilterObj);

    if frmENAgreeJointFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENAgreeJointFilter.Create;
      FilterObject := ENAgreeJointFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENAgreeJointFilterEdit.Free;
    frmENAgreeJointFilterEdit:=nil;
  end;}
end;

procedure TfrmENAgreeJointShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.