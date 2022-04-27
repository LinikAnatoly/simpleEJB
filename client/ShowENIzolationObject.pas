
unit ShowENIzolationObject;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENIzolationObjectController ;


type
  TfrmENIzolationObjectShow = class(TChildForm)  
  HTTPRIOENIzolationObject: THTTPRIO;
    ImageList1: TImageList;
    sgENIzolationObject: TAdvStringGrid;
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
procedure sgENIzolationObjectTopLeftChanged(Sender: TObject);
procedure sgENIzolationObjectDblClick(Sender: TObject);
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
 // ENIzolationObjectObj: ENIzolationObject;
 // ENIzolationObjectFilterObj: ENIzolationObjectFilter;
  
  
implementation

uses Main, EditENIzolationObject, EditENIzolationObjectFilter;


{$R *.dfm}

var
  //frmENIzolationObjectShow : TfrmENIzolationObjectShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENIzolationObjectHeaders: array [1..4] of String =
        ( 'Код'
          ,'Назва'
          ,'Бухгалтерське найменування'
          ,'Інвентарний номер'
        );
   

procedure TfrmENIzolationObjectShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENIzolationObjectShow:=nil;
    inherited;
  end;


procedure TfrmENIzolationObjectShow.FormShow(Sender: TObject);
var
  TempENIzolationObject: ENIzolationObjectControllerSoapPort;
  i: Integer;
  ENIzolationObjectList: ENIzolationObjectShortList;
  begin
  SetGridHeaders(ENIzolationObjectHeaders, sgENIzolationObject.ColumnHeaders);
  ColCount:=100;
  TempENIzolationObject :=  HTTPRIOENIzolationObject as ENIzolationObjectControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENIzolationObjectFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENIzolationObjectList := TempENIzolationObject.getScrollableFilteredList(ENIzolationObjectFilter(FilterObject),0,ColCount);


  LastCount:=High(ENIzolationObjectList.list);

  if LastCount > -1 then
     sgENIzolationObject.RowCount:=LastCount+2
  else
     sgENIzolationObject.RowCount:=2;

   with sgENIzolationObject do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENIzolationObjectList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENIzolationObjectList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENIzolationObjectList.list[i].name;
        Cells[2,i+1] := ENIzolationObjectList.list[i].buhName;
        Cells[3,i+1] := ENIzolationObjectList.list[i].invNumber;
        LastRow:=i+1;
        sgENIzolationObject.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENIzolationObject.Row:=1;
end;

procedure TfrmENIzolationObjectShow.sgENIzolationObjectTopLeftChanged(Sender: TObject);
var
  TempENIzolationObject: ENIzolationObjectControllerSoapPort;
  i,CurrentRow: Integer;
  ENIzolationObjectList: ENIzolationObjectShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENIzolationObject.TopRow + sgENIzolationObject.VisibleRowCount) = ColCount
  then
    begin
      TempENIzolationObject :=  HTTPRIOENIzolationObject as ENIzolationObjectControllerSoapPort;
      CurrentRow:=sgENIzolationObject.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENIzolationObjectFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENIzolationObjectList := TempENIzolationObject.getScrollableFilteredList(ENIzolationObjectFilter(FilterObject),ColCount-1, 100);



  sgENIzolationObject.RowCount:=sgENIzolationObject.RowCount+100;
  LastCount:=High(ENIzolationObjectList.list);
  with sgENIzolationObject do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENIzolationObjectList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENIzolationObjectList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENIzolationObjectList.list[i].name;
        Cells[2,i+CurrentRow] := ENIzolationObjectList.list[i].buhName;
        Cells[3,i+CurrentRow] := ENIzolationObjectList.list[i].invNumber;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENIzolationObject.Row:=CurrentRow-5;
   sgENIzolationObject.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENIzolationObjectShow.sgENIzolationObjectDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENIzolationObject,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENIzolationObjectShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENIzolationObject.RowCount-1 do
   for j:=0 to sgENIzolationObject.ColCount-1 do
     sgENIzolationObject.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENIzolationObjectShow.actViewExecute(Sender: TObject);
Var TempENIzolationObject: ENIzolationObjectControllerSoapPort;
begin
 TempENIzolationObject := HTTPRIOENIzolationObject as ENIzolationObjectControllerSoapPort;
   try
     ENIzolationObjectObj := TempENIzolationObject.getObject(StrToInt(sgENIzolationObject.Cells[0,sgENIzolationObject.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENIzolationObjectEdit:=TfrmENIzolationObjectEdit.Create(Application, dsView);
  try
    frmENIzolationObjectEdit.ShowModal;
  finally
    frmENIzolationObjectEdit.Free;
    frmENIzolationObjectEdit:=nil;
  end;
end;

procedure TfrmENIzolationObjectShow.actEditExecute(Sender: TObject);
Var TempENIzolationObject: ENIzolationObjectControllerSoapPort;
begin
 TempENIzolationObject := HTTPRIOENIzolationObject as ENIzolationObjectControllerSoapPort;
   try
     ENIzolationObjectObj := TempENIzolationObject.getObject(StrToInt(sgENIzolationObject.Cells[0,sgENIzolationObject.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENIzolationObjectEdit:=TfrmENIzolationObjectEdit.Create(Application, dsEdit);
  try
    if frmENIzolationObjectEdit.ShowModal= mrOk then
      begin
        //TempENIzolationObject.save(ENIzolationObjectObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENIzolationObjectEdit.Free;
    frmENIzolationObjectEdit:=nil;
  end;
end;

procedure TfrmENIzolationObjectShow.actDeleteExecute(Sender: TObject);
Var TempENIzolationObject: ENIzolationObjectControllerSoapPort;
  ObjCode: Integer;
begin
 TempENIzolationObject := HTTPRIOENIzolationObject as ENIzolationObjectControllerSoapPort;
   try
     ObjCode := StrToInt(sgENIzolationObject.Cells[0,sgENIzolationObject.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Обьект Ізоляції) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENIzolationObject.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENIzolationObjectShow.actInsertExecute(Sender: TObject);
Var TempENIzolationObject: ENIzolationObjectControllerSoapPort;
begin
  TempENIzolationObject := HTTPRIOENIzolationObject as ENIzolationObjectControllerSoapPort;
  ENIzolationObjectObj:=ENIzolationObject.Create;



  try
    frmENIzolationObjectEdit:=TfrmENIzolationObjectEdit.Create(Application, dsInsert);
    try
      if frmENIzolationObjectEdit.ShowModal = mrOk then
      begin
        if ENIzolationObjectObj<>nil then
            //TempENIzolationObject.add(ENIzolationObjectObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENIzolationObjectEdit.Free;
      frmENIzolationObjectEdit:=nil;
    end;
  finally
    ENIzolationObjectObj.Free;
  end;
end;

procedure TfrmENIzolationObjectShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENIzolationObjectShow.actFilterExecute(Sender: TObject);
begin
  frmENIzolationObjectFilterEdit:=TfrmENIzolationObjectFilterEdit.Create(Application, dsInsert);
  try
    ENIzolationObjectFilterObj := ENIzolationObjectFilter.Create;
    SetNullIntProps(ENIzolationObjectFilterObj);
    SetNullXSProps(ENIzolationObjectFilterObj);

    if frmENIzolationObjectFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENIzolationObjectFilter.Create;
      FilterObject := ENIzolationObjectFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENIzolationObjectFilterEdit.Free;
    frmENIzolationObjectFilterEdit:=nil;
  end;
end;

procedure TfrmENIzolationObjectShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.