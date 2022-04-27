
unit ShowENSDTUObject;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENSDTUObjectController, ENSDTUObjectTypeController, ENConsts, AdvObj ;

 type ENSDTUObjectShowFormKind = (DEFAULT, SMART_IMS);
type
  TfrmENSDTUObjectShow = class(TChildForm)  
  HTTPRIOENSDTUObject: THTTPRIO;
    ImageList1: TImageList;
    sgENSDTUObject: TAdvStringGrid;
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
procedure sgENSDTUObjectTopLeftChanged(Sender: TObject);
procedure sgENSDTUObjectDblClick(Sender: TObject);
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
    kind : ENSDTUObjectShowFormKind;
        constructor Create(AOwner: TComponent;
                       FormMode: TFormMode;
                       formKind: ENSDTUObjectShowFormKind); reintroduce; overload;

   { Public declarations }
   procedure UpdateGrid(Sender: TObject);
 end;

//var
 // ENSDTUObjectObj: ENSDTUObject;
 // ENSDTUObjectFilterObj: ENSDTUObjectFilter;
  
  
implementation

uses Main, EditENSDTUObject, EditENSDTUObjectFilter;


{$R *.dfm}

var
  //frmENSDTUObjectShow : TfrmENSDTUObjectShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENSDTUObjectHeaders: array [1..4] of String =
        ( 'Код'
          ,'Назва'
          ,'Бухгалтерське найменування'
          ,'Інвентарний номер'
        );

constructor TfrmENSDTUObjectShow.Create(AOwner: TComponent; FormMode: TFormMode;
                              formKind: ENSDTUObjectShowFormKind);
begin
  Self.kind := formKind;
  inherited Create(AOwner, FormMode);
end;
procedure TfrmENSDTUObjectShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
  if FormMode = fmChild then begin
      if Self.kind = ENSDTUObjectShowFormKind.DEFAULT then begin
        frmENSDTUObjectShow := nil;
      end else begin
        if Self.kind = ENSDTUObjectShowFormKind.SMART_IMS then begin
          frmENSEPOSmartObjectShow := nil;
        end;
      end;
  end;
  inherited;
  end;


procedure TfrmENSDTUObjectShow.FormShow(Sender: TObject);
var
  TempENSDTUObject: ENSDTUObjectControllerSoapPort;
  i: Integer;
  ENSDTUObjectList: ENSDTUObjectShortList;
  begin
  SetGridHeaders(ENSDTUObjectHeaders, sgENSDTUObject.ColumnHeaders);
  ColCount:=100;
  TempENSDTUObject :=  HTTPRIOENSDTUObject as ENSDTUObjectControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENSDTUObjectFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  if Self.kind = ENSDTUObjectShowFormKind.SMART_IMS then begin
    ENSDTUObjectFilter(FilterObject).objectType := ENSDTUObjectType.Create;
    ENSDTUObjectFilter(FilterObject).objectType.code := ENSDTUOBJECT_TYPE_SMART_IMS;
  end;



  ENSDTUObjectList := TempENSDTUObject.getScrollableFilteredList(ENSDTUObjectFilter(FilterObject),0,ColCount);


  LastCount:=High(ENSDTUObjectList.list);

  if LastCount > -1 then
     sgENSDTUObject.RowCount:=LastCount+2
  else
     sgENSDTUObject.RowCount:=2;

   with sgENSDTUObject do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSDTUObjectList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENSDTUObjectList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENSDTUObjectList.list[i].name;
        Cells[2,i+1] := ENSDTUObjectList.list[i].buhName;
        Cells[3,i+1] := ENSDTUObjectList.list[i].invNumber;
        LastRow:=i+1;
        sgENSDTUObject.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENSDTUObject.Row:=1;
end;

procedure TfrmENSDTUObjectShow.sgENSDTUObjectTopLeftChanged(Sender: TObject);
var
  TempENSDTUObject: ENSDTUObjectControllerSoapPort;
  i,CurrentRow: Integer;
  ENSDTUObjectList: ENSDTUObjectShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENSDTUObject.TopRow + sgENSDTUObject.VisibleRowCount) = ColCount
  then
    begin
      TempENSDTUObject :=  HTTPRIOENSDTUObject as ENSDTUObjectControllerSoapPort;
      CurrentRow:=sgENSDTUObject.RowCount;

  if FilterObject = nil then begin
     FilterObject := ENSDTUObjectFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  if Self.kind = ENSDTUObjectShowFormKind.SMART_IMS then begin
    ENSDTUObjectFilter(FilterObject).objectType := ENSDTUObjectType.Create;
    ENSDTUObjectFilter(FilterObject).objectType.code := ENSDTUOBJECT_TYPE_SMART_IMS;
  end;
  ENSDTUObjectList := TempENSDTUObject.getScrollableFilteredList(ENSDTUObjectFilter(FilterObject),ColCount-1, 100);



  sgENSDTUObject.RowCount:=sgENSDTUObject.RowCount+100;
  LastCount:=High(ENSDTUObjectList.list);
  with sgENSDTUObject do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSDTUObjectList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENSDTUObjectList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENSDTUObjectList.list[i].name;
        Cells[2,i+CurrentRow] := ENSDTUObjectList.list[i].buhName;
        Cells[3,i+CurrentRow] := ENSDTUObjectList.list[i].invNumber;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENSDTUObject.Row:=CurrentRow-5;
   sgENSDTUObject.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENSDTUObjectShow.sgENSDTUObjectDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENSDTUObject,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENSDTUObjectShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENSDTUObject.RowCount-1 do
   for j:=0 to sgENSDTUObject.ColCount-1 do
     sgENSDTUObject.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENSDTUObjectShow.actViewExecute(Sender: TObject);
Var TempENSDTUObject: ENSDTUObjectControllerSoapPort;
begin
 TempENSDTUObject := HTTPRIOENSDTUObject as ENSDTUObjectControllerSoapPort;
   try
     ENSDTUObjectObj := TempENSDTUObject.getObject(StrToInt(sgENSDTUObject.Cells[0,sgENSDTUObject.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENSDTUObjectEdit:=TfrmENSDTUObjectEdit.Create(Application, dsView);
  try
    frmENSDTUObjectEdit.ShowModal;
  finally
    frmENSDTUObjectEdit.Free;
    frmENSDTUObjectEdit:=nil;
  end;
end;

procedure TfrmENSDTUObjectShow.actEditExecute(Sender: TObject);
Var TempENSDTUObject: ENSDTUObjectControllerSoapPort;
begin
 TempENSDTUObject := HTTPRIOENSDTUObject as ENSDTUObjectControllerSoapPort;
   try
     ENSDTUObjectObj := TempENSDTUObject.getObject(StrToInt(sgENSDTUObject.Cells[0,sgENSDTUObject.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENSDTUObjectEdit:=TfrmENSDTUObjectEdit.Create(Application, dsEdit);
  try
    if frmENSDTUObjectEdit.ShowModal= mrOk then
      begin
        //TempENSDTUObject.save(ENSDTUObjectObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENSDTUObjectEdit.Free;
    frmENSDTUObjectEdit:=nil;
  end;
end;

procedure TfrmENSDTUObjectShow.actDeleteExecute(Sender: TObject);
Var TempENSDTUObject: ENSDTUObjectControllerSoapPort;
  ObjCode: Integer;
begin
 TempENSDTUObject := HTTPRIOENSDTUObject as ENSDTUObjectControllerSoapPort;
   try
     ObjCode := StrToInt(sgENSDTUObject.Cells[0,sgENSDTUObject.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Обьект СДТУ) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENSDTUObject.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENSDTUObjectShow.actInsertExecute(Sender: TObject);
Var TempENSDTUObject: ENSDTUObjectControllerSoapPort;
begin
  TempENSDTUObject := HTTPRIOENSDTUObject as ENSDTUObjectControllerSoapPort;
  ENSDTUObjectObj:=ENSDTUObject.Create;



  try
    frmENSDTUObjectEdit:=TfrmENSDTUObjectEdit.Create(Application, dsInsert);
    try
      if frmENSDTUObjectEdit.ShowModal = mrOk then
      begin
        if ENSDTUObjectObj<>nil then
            //TempENSDTUObject.add(ENSDTUObjectObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENSDTUObjectEdit.Free;
      frmENSDTUObjectEdit:=nil;
    end;
  finally
    ENSDTUObjectObj.Free;
  end;
end;

procedure TfrmENSDTUObjectShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENSDTUObjectShow.actFilterExecute(Sender: TObject);
begin
  frmENSDTUObjectFilterEdit:=TfrmENSDTUObjectFilterEdit.Create(Application, dsEdit);
  try
    if Self.kind = ENSDTUObjectShowFormKind.SMART_IMS then begin
      frmENSDTUObjectFilterEdit.hideObjectType;
    end;

    ENSDTUObjectFilterObj := ENSDTUObjectFilter.Create;
    SetNullIntProps(ENSDTUObjectFilterObj);
    SetNullXSProps(ENSDTUObjectFilterObj);

    if frmENSDTUObjectFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENSDTUObjectFilter.Create;
      FilterObject := ENSDTUObjectFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENSDTUObjectFilterEdit.Free;
    frmENSDTUObjectFilterEdit:=nil;
  end;
end;

procedure TfrmENSDTUObjectShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;



end.