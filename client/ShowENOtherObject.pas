
unit ShowENOtherObject;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENOtherObjectController ;


type
  TfrmENOtherObjectShow = class(TChildForm)  
  HTTPRIOENOtherObject: THTTPRIO;
    ImageList1: TImageList;
    sgENOtherObject: TAdvStringGrid;
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
procedure sgENOtherObjectTopLeftChanged(Sender: TObject);
procedure sgENOtherObjectDblClick(Sender: TObject);
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
 // ENOtherObjectObj: ENOtherObject;
 // ENOtherObjectFilterObj: ENOtherObjectFilter;
  
  
implementation

uses Main, EditENOtherObject, EditENOtherObjectFilter,
  ENOtherObjectTypeController, ENConsts;


{$R *.dfm}

var
  //frmENOtherObjectShow : TfrmENOtherObjectShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENOtherObjectHeaders: array [1..7] of String =
        ( 'Код'
          ,'Назва'
          ,'Примітка'
          ,'Бухгалтерське найменування'
          ,'Інвентарний номер'
          ,'пользователь внесший изменение'
          ,'дата последнего изменения'
        );
   

procedure TfrmENOtherObjectShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENOtherObjectShow:=nil;
    inherited;
  end;


procedure TfrmENOtherObjectShow.FormShow(Sender: TObject);
var
  TempENOtherObject: ENOtherObjectControllerSoapPort;
  i: Integer;
  ENOtherObjectList: ENOtherObjectShortList;
  begin
  SetGridHeaders(ENOtherObjectHeaders, sgENOtherObject.ColumnHeaders);
  ColCount:=100;
  TempENOtherObject :=  HTTPRIOENOtherObject as ENOtherObjectControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENOtherObjectFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENOtherObjectList := TempENOtherObject.getScrollableFilteredList(ENOtherObjectFilter(FilterObject),0,ColCount);


  LastCount:=High(ENOtherObjectList.list);

  if LastCount > -1 then
     sgENOtherObject.RowCount:=LastCount+2
  else
     sgENOtherObject.RowCount:=2;

   with sgENOtherObject do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENOtherObjectList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENOtherObjectList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENOtherObjectList.list[i].name;
        Cells[2,i+1] := ENOtherObjectList.list[i].commentGen;
        Cells[3,i+1] := ENOtherObjectList.list[i].buhName;
        Cells[4,i+1] := ENOtherObjectList.list[i].invNumber;
        Cells[5,i+1] := ENOtherObjectList.list[i].userGen;
        if ENOtherObjectList.list[i].dateEdit = nil then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := XSDate2String(ENOtherObjectList.list[i].dateEdit);
        LastRow:=i+1;
        sgENOtherObject.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENOtherObject.Row:=1;
end;

procedure TfrmENOtherObjectShow.sgENOtherObjectTopLeftChanged(Sender: TObject);
var
  TempENOtherObject: ENOtherObjectControllerSoapPort;
  i,CurrentRow: Integer;
  ENOtherObjectList: ENOtherObjectShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENOtherObject.TopRow + sgENOtherObject.VisibleRowCount) = ColCount
  then
    begin
      TempENOtherObject :=  HTTPRIOENOtherObject as ENOtherObjectControllerSoapPort;
      CurrentRow:=sgENOtherObject.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENOtherObjectFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENOtherObjectList := TempENOtherObject.getScrollableFilteredList(ENOtherObjectFilter(FilterObject),ColCount-1, 100);



  sgENOtherObject.RowCount:=sgENOtherObject.RowCount+100;
  LastCount:=High(ENOtherObjectList.list);
  with sgENOtherObject do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENOtherObjectList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENOtherObjectList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENOtherObjectList.list[i].name;
        Cells[2,i+CurrentRow] := ENOtherObjectList.list[i].commentGen;
        Cells[3,i+CurrentRow] := ENOtherObjectList.list[i].buhName;
        Cells[4,i+CurrentRow] := ENOtherObjectList.list[i].invNumber;
        Cells[5,i+CurrentRow] := ENOtherObjectList.list[i].userGen;
        if ENOtherObjectList.list[i].dateEdit = nil then
          Cells[6,i+CurrentRow] := ''
        else
          Cells[6,i+CurrentRow] := XSDate2String(ENOtherObjectList.list[i].dateEdit);
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENOtherObject.Row:=CurrentRow-5;
   sgENOtherObject.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENOtherObjectShow.sgENOtherObjectDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENOtherObject,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENOtherObjectShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENOtherObject.RowCount-1 do
   for j:=0 to sgENOtherObject.ColCount-1 do
     sgENOtherObject.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENOtherObjectShow.actViewExecute(Sender: TObject);
Var TempENOtherObject: ENOtherObjectControllerSoapPort;
begin
 TempENOtherObject := HTTPRIOENOtherObject as ENOtherObjectControllerSoapPort;
   try
     ENOtherObjectObj := TempENOtherObject.getObject(StrToInt(sgENOtherObject.Cells[0,sgENOtherObject.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENOtherObjectEdit:=TfrmENOtherObjectEdit.Create(Application, dsView);
  try
    frmENOtherObjectEdit.ShowModal;
  finally
    frmENOtherObjectEdit.Free;
    frmENOtherObjectEdit:=nil;
  end;
end;

procedure TfrmENOtherObjectShow.actEditExecute(Sender: TObject);
Var TempENOtherObject: ENOtherObjectControllerSoapPort;
begin
 TempENOtherObject := HTTPRIOENOtherObject as ENOtherObjectControllerSoapPort;
   try
     ENOtherObjectObj := TempENOtherObject.getObject(StrToInt(sgENOtherObject.Cells[0,sgENOtherObject.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENOtherObjectEdit:=TfrmENOtherObjectEdit.Create(Application, dsEdit);
  try
    frmENOtherObjectEdit.Caption := Caption;
    if frmENOtherObjectEdit.ShowModal= mrOk then
      begin
        //TempENOtherObject.save(ENOtherObjectObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENOtherObjectEdit.Free;
    frmENOtherObjectEdit:=nil;
  end;
end;

procedure TfrmENOtherObjectShow.actDeleteExecute(Sender: TObject);
Var TempENOtherObject: ENOtherObjectControllerSoapPort;
  ObjCode: Integer;
begin
 TempENOtherObject := HTTPRIOENOtherObject as ENOtherObjectControllerSoapPort;
   try
     ObjCode := StrToInt(sgENOtherObject.Cells[0,sgENOtherObject.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Інші обьєкти з Інв. номером) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENOtherObject.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENOtherObjectShow.actInsertExecute(Sender: TObject);
Var TempENOtherObject: ENOtherObjectControllerSoapPort;
begin

  if FilterObject = nil then Exit;

  TempENOtherObject := HTTPRIOENOtherObject as ENOtherObjectControllerSoapPort;
  ENOtherObjectObj:=ENOtherObject.Create;

   ENOtherObjectObj.dateEdit:= TXSDate.Create;

   ENOtherObjectObj.typeRef := ENOtherObjectTypeRef.Create();
   ENOtherObjectObj.typeRef.code := ENOtherObjectFilter(FilterObject).typeRef.code;

  try
    frmENOtherObjectEdit:=TfrmENOtherObjectEdit.Create(Application, dsInsert);
    try
      frmENOtherObjectEdit.Caption := Caption;
      if frmENOtherObjectEdit.ShowModal = mrOk then
      begin
        if ENOtherObjectObj<>nil then
            //TempENOtherObject.add(ENOtherObjectObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENOtherObjectEdit.Free;
      frmENOtherObjectEdit:=nil;
    end;
  finally
    ENOtherObjectObj.Free;
  end;
end;

procedure TfrmENOtherObjectShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENOtherObjectShow.actFilterExecute(Sender: TObject);
begin

  if FilterObject = nil then Exit;

  frmENOtherObjectFilterEdit:=TfrmENOtherObjectFilterEdit.Create(Application, dsEdit);
  try
    ENOtherObjectFilterObj := ENOtherObjectFilter.Create;
    SetNullIntProps(ENOtherObjectFilterObj);
    SetNullXSProps(ENOtherObjectFilterObj);

    ENOtherObjectFilterObj.typeRef := ENOtherObjectTypeRef.Create;
    ENOtherObjectFilterObj.typeRef.code := ENOtherObjectFilter(FilterObject).typeRef.code; 

    frmENOtherObjectFilterEdit.Caption := Caption;

    if frmENOtherObjectFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENOtherObjectFilter.Create;
      FilterObject := ENOtherObjectFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENOtherObjectFilterEdit.Free;
    frmENOtherObjectFilterEdit:=nil;
  end;
end;

procedure TfrmENOtherObjectShow.actNoFilterExecute(Sender: TObject);
var typeCode: Integer;
begin

  ///// Сохраняем код типа элемента
  typeCode := LOW_INT;

  if FilterObject <> nil then
    if ENOtherObjectFilter(FilterObject).typeRef <> nil then
      typeCode := ENOtherObjectFilter(FilterObject).typeRef.code;
  /////

  FilterObject.Free;
  FilterObject := nil;

  ///// Пересоздаем фильтр и возвращаем обратно код типа элемента
  FilterObject := ENOtherObjectFilter.Create;
  SetNullIntProps(FilterObject);
  SetNullXSProps(FilterObject);

  ENOtherObjectFilter(FilterObject).typeRef := ENOtherObjectTypeRef.Create();
  ENOtherObjectFilter(FilterObject).typeRef.code := typeCode;
  /////

  UpdateGrid(Sender);


end;

end.