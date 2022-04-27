
unit ShowENPreproductionObject;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENPreproductionObjectController, AdvObj ;


type
  TfrmENPreproductionObjectShow = class(TChildForm)  
  HTTPRIOENPreproductionObject: THTTPRIO;
    ImageList1: TImageList;
    sgENPreproductionObject: TAdvStringGrid;
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
procedure sgENPreproductionObjectTopLeftChanged(Sender: TObject);
procedure sgENPreproductionObjectDblClick(Sender: TObject);
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
 // ENPreproductionObjectObj: ENPreproductionObject;
 // ENPreproductionObjectFilterObj: ENPreproductionObjectFilter;
  
  
implementation

uses Main, EditENPreproductionObject, EditENPreproductionObjectFilter;


{$R *.dfm}

var
  //frmENPreproductionObjectShow : TfrmENPreproductionObjectShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENPreproductionObjectHeaders: array [1..7] of String =
        ( 'Код'
          ,'Назва'
          ,'Інв. номер'
          ,'Бух. найменування'
          ,'Примітка'          
          ,'пользователь внесший изменение'
          ,'дата последнего изменения'
        );
   

procedure TfrmENPreproductionObjectShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENPreproductionObjectShow:=nil;
    inherited;
  end;


procedure TfrmENPreproductionObjectShow.FormShow(Sender: TObject);
var
  TempENPreproductionObject: ENPreproductionObjectControllerSoapPort;
  i: Integer;
  ENPreproductionObjectList: ENPreproductionObjectShortList;
  begin
  SetGridHeaders(ENPreproductionObjectHeaders, sgENPreproductionObject.ColumnHeaders);
  ColCount:=100;
  TempENPreproductionObject :=  HTTPRIOENPreproductionObject as ENPreproductionObjectControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENPreproductionObjectFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENPreproductionObjectList := TempENPreproductionObject.getScrollableFilteredList(ENPreproductionObjectFilter(FilterObject),0,ColCount);


  LastCount:=High(ENPreproductionObjectList.list);

  if LastCount > -1 then
     sgENPreproductionObject.RowCount:=LastCount+2
  else
     sgENPreproductionObject.RowCount:=2;

   with sgENPreproductionObject do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENPreproductionObjectList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENPreproductionObjectList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENPreproductionObjectList.list[i].name;
        Cells[2,i+1] := ENPreproductionObjectList.list[i].invNumber;
        Cells[3,i+1] := ENPreproductionObjectList.list[i].buhName;
        Cells[4,i+1] := ENPreproductionObjectList.list[i].commentGen;
        Cells[5,i+1] := ENPreproductionObjectList.list[i].userGen;
        if ENPreproductionObjectList.list[i].dateEdit = nil then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := XSDate2String(ENPreproductionObjectList.list[i].dateEdit);
        LastRow:=i+1;
        sgENPreproductionObject.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENPreproductionObject.Row:=1;
end;

procedure TfrmENPreproductionObjectShow.sgENPreproductionObjectTopLeftChanged(Sender: TObject);
var
  TempENPreproductionObject: ENPreproductionObjectControllerSoapPort;
  i,CurrentRow: Integer;
  ENPreproductionObjectList: ENPreproductionObjectShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENPreproductionObject.TopRow + sgENPreproductionObject.VisibleRowCount) = ColCount
  then
    begin
      TempENPreproductionObject :=  HTTPRIOENPreproductionObject as ENPreproductionObjectControllerSoapPort;
      CurrentRow:=sgENPreproductionObject.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENPreproductionObjectFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENPreproductionObjectList := TempENPreproductionObject.getScrollableFilteredList(ENPreproductionObjectFilter(FilterObject),ColCount-1, 100);



  sgENPreproductionObject.RowCount:=sgENPreproductionObject.RowCount+100;
  LastCount:=High(ENPreproductionObjectList.list);
  with sgENPreproductionObject do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENPreproductionObjectList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENPreproductionObjectList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENPreproductionObjectList.list[i].name;
        Cells[2,i+CurrentRow] := ENPreproductionObjectList.list[i].invNumber;
        Cells[3,i+CurrentRow] := ENPreproductionObjectList.list[i].buhName;
        Cells[4,i+CurrentRow] := ENPreproductionObjectList.list[i].commentGen;
        Cells[5,i+CurrentRow] := ENPreproductionObjectList.list[i].userGen;
        if ENPreproductionObjectList.list[i].dateEdit = nil then
          Cells[6,i+CurrentRow] := ''
        else
          Cells[6,i+CurrentRow] := XSDate2String(ENPreproductionObjectList.list[i].dateEdit);
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENPreproductionObject.Row:=CurrentRow-5;
   sgENPreproductionObject.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENPreproductionObjectShow.sgENPreproductionObjectDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENPreproductionObject,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENPreproductionObjectShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENPreproductionObject.RowCount-1 do
   for j:=0 to sgENPreproductionObject.ColCount-1 do
     sgENPreproductionObject.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENPreproductionObjectShow.actViewExecute(Sender: TObject);
Var TempENPreproductionObject: ENPreproductionObjectControllerSoapPort;
begin
 TempENPreproductionObject := HTTPRIOENPreproductionObject as ENPreproductionObjectControllerSoapPort;
   try
     ENPreproductionObjectObj := TempENPreproductionObject.getObject(StrToInt(sgENPreproductionObject.Cells[0,sgENPreproductionObject.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENPreproductionObjectEdit:=TfrmENPreproductionObjectEdit.Create(Application, dsView);
  try
    frmENPreproductionObjectEdit.ShowModal;
  finally
    frmENPreproductionObjectEdit.Free;
    frmENPreproductionObjectEdit:=nil;
  end;
end;

procedure TfrmENPreproductionObjectShow.actEditExecute(Sender: TObject);
Var TempENPreproductionObject: ENPreproductionObjectControllerSoapPort;
begin
 TempENPreproductionObject := HTTPRIOENPreproductionObject as ENPreproductionObjectControllerSoapPort;
   try
     ENPreproductionObjectObj := TempENPreproductionObject.getObject(StrToInt(sgENPreproductionObject.Cells[0,sgENPreproductionObject.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENPreproductionObjectEdit:=TfrmENPreproductionObjectEdit.Create(Application, dsEdit);
  try
    if frmENPreproductionObjectEdit.ShowModal= mrOk then
      begin
        //TempENPreproductionObject.save(ENPreproductionObjectObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENPreproductionObjectEdit.Free;
    frmENPreproductionObjectEdit:=nil;
  end;
end;

procedure TfrmENPreproductionObjectShow.actDeleteExecute(Sender: TObject);
Var TempENPreproductionObject: ENPreproductionObjectControllerSoapPort;
  ObjCode: Integer;
begin
 TempENPreproductionObject := HTTPRIOENPreproductionObject as ENPreproductionObjectControllerSoapPort;
   try
     ObjCode := StrToInt(sgENPreproductionObject.Cells[0,sgENPreproductionObject.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Обьєкти ЦПВ) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENPreproductionObject.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENPreproductionObjectShow.actInsertExecute(Sender: TObject);
Var TempENPreproductionObject: ENPreproductionObjectControllerSoapPort;
begin
  TempENPreproductionObject := HTTPRIOENPreproductionObject as ENPreproductionObjectControllerSoapPort;
  ENPreproductionObjectObj:=ENPreproductionObject.Create;

   ENPreproductionObjectObj.dateEdit:= TXSDate.Create;


  try
    frmENPreproductionObjectEdit:=TfrmENPreproductionObjectEdit.Create(Application, dsInsert);
    try
      if frmENPreproductionObjectEdit.ShowModal = mrOk then
      begin
        if ENPreproductionObjectObj<>nil then
            //TempENPreproductionObject.add(ENPreproductionObjectObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENPreproductionObjectEdit.Free;
      frmENPreproductionObjectEdit:=nil;
    end;
  finally
    ENPreproductionObjectObj.Free;
  end;
end;

procedure TfrmENPreproductionObjectShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENPreproductionObjectShow.actFilterExecute(Sender: TObject);
begin
{frmENPreproductionObjectFilterEdit:=TfrmENPreproductionObjectFilterEdit.Create(Application, dsEdit);
  try
    ENPreproductionObjectFilterObj := ENPreproductionObjectFilter.Create;
    SetNullIntProps(ENPreproductionObjectFilterObj);
    SetNullXSProps(ENPreproductionObjectFilterObj);

    if frmENPreproductionObjectFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENPreproductionObjectFilter.Create;
      FilterObject := ENPreproductionObjectFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENPreproductionObjectFilterEdit.Free;
    frmENPreproductionObjectFilterEdit:=nil;
  end;}
end;

procedure TfrmENPreproductionObjectShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.