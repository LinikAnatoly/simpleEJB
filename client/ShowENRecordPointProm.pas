
unit ShowENRecordPointProm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENRecordPointPromController, AdvObj ;


type
  TfrmENRecordPointPromShow = class(TChildForm)  
  HTTPRIOENRecordPointProm: THTTPRIO;
    ImageList1: TImageList;
    sgENRecordPointProm: TAdvStringGrid;
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
procedure sgENRecordPointPromTopLeftChanged(Sender: TObject);
procedure sgENRecordPointPromDblClick(Sender: TObject);
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
   class function chooseFromList(f : ENRecordPointPromFilter = nil) : ENRecordPointPromShort; stdcall; static;
 end;

//var
 // ENRecordPointPromObj: ENRecordPointProm;
 // ENRecordPointPromFilterObj: ENRecordPointPromFilter;

var
  frmENRecordPointPromShow : TfrmENRecordPointPromShow;


implementation

uses Main, EditENRecordPointProm, EditENRecordPointPromFilter;


{$R *.dfm}

var
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENRecordPointPromHeaders: array [1..9] of String =
        ( 'Код'
          ,'Особовий рахунок'
          ,'Назва абонента'
          ,'серийный № счетчика'
          ,'Назва ТУ'
          ,'Адрес ТУ'
          ,'Вид ТУ (актив/реактив/генерація)'
          ,'код з EnergyPro'
          , 'Підрозділ'
        );


class function TfrmENRecordPointPromShow.chooseFromList(f : ENRecordPointPromFilter = nil) : ENRecordPointPromShort;
var
  f1 : ENRecordPointPromFilter;
  frmENRecordPointPromShow : TfrmENRecordPointPromShow;
  selected : ENRecordPointPromShort;
begin
  inherited;
     selected := nil;
     if not Assigned(f) then begin
         f1 := ENRecordPointPromFilter.Create;
         SetNullXSProps(f1);
         SetNullIntProps(f1);
     end else begin
       f1 := f;
     end;
     frmENRecordPointPromShow := TfrmENRecordPointPromShow.Create(Application,fmNormal, f1);
       try
          with frmENRecordPointPromShow do
          begin
            DisableActions([ actEdit, actInsert, actDelete ]);
            if ShowModal = mrOk then
            begin
                try
                  selected := ENRecordPointPromShort(sgENRecordPointProm.Objects[0, sgENRecordPointProm.Row]);
                except
                   on EConvertError do Exit;
                end;
            end;
          end;
       finally
          frmENRecordPointPromShow.Free;
       end;
	   Result := selected;
end;

procedure TfrmENRecordPointPromShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENRecordPointPromShow:=nil;
    inherited;
  end;


procedure TfrmENRecordPointPromShow.FormShow(Sender: TObject);
var
  TempENRecordPointProm: ENRecordPointPromControllerSoapPort;
  i: Integer;
  ENRecordPointPromList: ENRecordPointPromShortList;
  begin

  DisableActions([actInsert, actDelete, actEdit]);

  SetGridHeaders(ENRecordPointPromHeaders, sgENRecordPointProm.ColumnHeaders);
  ColCount:=100;
  TempENRecordPointProm :=  HTTPRIOENRecordPointProm as ENRecordPointPromControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENRecordPointPromFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENRecordPointPromList := TempENRecordPointProm.getScrollableFilteredList(ENRecordPointPromFilter(FilterObject),0,ColCount);


  LastCount:=High(ENRecordPointPromList.list);

  if LastCount > -1 then
     sgENRecordPointProm.RowCount:=LastCount+2
  else
     sgENRecordPointProm.RowCount:=2;

   with sgENRecordPointProm do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENRecordPointPromList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENRecordPointPromList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENRecordPointPromList.list[i].accountNumber;
        Cells[2,i+1] := ENRecordPointPromList.list[i].accountName;
        Cells[3,i+1] := ENRecordPointPromList.list[i].counterNumber;
        Cells[4,i+1] := ENRecordPointPromList.list[i].recordPointName;
        Cells[5,i+1] := ENRecordPointPromList.list[i].recordPointAddr;
        Cells[6,i+1] := ENRecordPointPromList.list[i].recordPointKindName;
        if ENRecordPointPromList.list[i].recordPointCode = Low(Integer) then
          Cells[7,i+1] := ''
        else
          Cells[7,i+1] := IntToStr(ENRecordPointPromList.list[i].recordPointCode);
        Cells[8,i+1] := ENRecordPointPromList.list[i].renName;
        LastRow:=i+1;
        sgENRecordPointProm.RowCount:=LastRow+1;

        Objects[0,i+1] := ENRecordPointPromList.list[i];
      end;
   ColCount:=ColCount+1;
   sgENRecordPointProm.Row:=1;
end;

procedure TfrmENRecordPointPromShow.sgENRecordPointPromTopLeftChanged(Sender: TObject);
var
  TempENRecordPointProm: ENRecordPointPromControllerSoapPort;
  i,CurrentRow: Integer;
  ENRecordPointPromList: ENRecordPointPromShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENRecordPointProm.TopRow + sgENRecordPointProm.VisibleRowCount) = ColCount
  then
    begin
      TempENRecordPointProm :=  HTTPRIOENRecordPointProm as ENRecordPointPromControllerSoapPort;
      CurrentRow:=sgENRecordPointProm.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENRecordPointPromFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENRecordPointPromList := TempENRecordPointProm.getScrollableFilteredList(ENRecordPointPromFilter(FilterObject),ColCount-1, 100);



  sgENRecordPointProm.RowCount:=sgENRecordPointProm.RowCount+100;
  LastCount:=High(ENRecordPointPromList.list);
  with sgENRecordPointProm do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENRecordPointPromList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENRecordPointPromList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENRecordPointPromList.list[i].accountNumber;
        Cells[2,i+CurrentRow] := ENRecordPointPromList.list[i].accountName;
        Cells[3,i+CurrentRow] := ENRecordPointPromList.list[i].counterNumber;
        Cells[4,i+CurrentRow] := ENRecordPointPromList.list[i].recordPointName;
        Cells[5,i+CurrentRow] := ENRecordPointPromList.list[i].recordPointAddr;
        Cells[6,i+CurrentRow] := ENRecordPointPromList.list[i].recordPointKindName;
        if ENRecordPointPromList.list[i].recordPointCode = Low(Integer) then
          Cells[7,i+CurrentRow] := ''
        else
          Cells[7,i+CurrentRow] := IntToStr(ENRecordPointPromList.list[i].recordPointCode);
        Cells[8,i+CurrentRow] := ENRecordPointPromList.list[i].renName;
          Objects[0,i+CurrentRow] := ENRecordPointPromList.list[i];

          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENRecordPointProm.Row:=CurrentRow-5;
   sgENRecordPointProm.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENRecordPointPromShow.sgENRecordPointPromDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENRecordPointProm,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENRecordPointPromShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENRecordPointProm.RowCount-1 do
   for j:=0 to sgENRecordPointProm.ColCount-1 do
     sgENRecordPointProm.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENRecordPointPromShow.actViewExecute(Sender: TObject);
Var TempENRecordPointProm: ENRecordPointPromControllerSoapPort;
begin
 TempENRecordPointProm := HTTPRIOENRecordPointProm as ENRecordPointPromControllerSoapPort;
   try
     ENRecordPointPromObj := TempENRecordPointProm.getObject(StrToInt(sgENRecordPointProm.Cells[0,sgENRecordPointProm.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENRecordPointPromEdit:=TfrmENRecordPointPromEdit.Create(Application, dsView);
  try
    frmENRecordPointPromEdit.ShowModal;
  finally
    frmENRecordPointPromEdit.Free;
    frmENRecordPointPromEdit:=nil;
  end;
end;

procedure TfrmENRecordPointPromShow.actEditExecute(Sender: TObject);
Var TempENRecordPointProm: ENRecordPointPromControllerSoapPort;
begin
 TempENRecordPointProm := HTTPRIOENRecordPointProm as ENRecordPointPromControllerSoapPort;
   try
     ENRecordPointPromObj := TempENRecordPointProm.getObject(StrToInt(sgENRecordPointProm.Cells[0,sgENRecordPointProm.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENRecordPointPromEdit:=TfrmENRecordPointPromEdit.Create(Application, dsEdit);
  try
    if frmENRecordPointPromEdit.ShowModal= mrOk then
      begin
        //TempENRecordPointProm.save(ENRecordPointPromObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENRecordPointPromEdit.Free;
    frmENRecordPointPromEdit:=nil;
  end;
end;

procedure TfrmENRecordPointPromShow.actDeleteExecute(Sender: TObject);
Var TempENRecordPointProm: ENRecordPointPromControllerSoapPort;
  ObjCode: Integer;
begin
 TempENRecordPointProm := HTTPRIOENRecordPointProm as ENRecordPointPromControllerSoapPort;
   try
     ObjCode := StrToInt(sgENRecordPointProm.Cells[0,sgENRecordPointProm.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (ТУ прома ) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENRecordPointProm.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENRecordPointPromShow.actInsertExecute(Sender: TObject);
Var TempENRecordPointProm: ENRecordPointPromControllerSoapPort;
begin
  TempENRecordPointProm := HTTPRIOENRecordPointProm as ENRecordPointPromControllerSoapPort;
  ENRecordPointPromObj:=ENRecordPointProm.Create;



  try
    frmENRecordPointPromEdit:=TfrmENRecordPointPromEdit.Create(Application, dsInsert);
    try
      if frmENRecordPointPromEdit.ShowModal = mrOk then
      begin
        if ENRecordPointPromObj<>nil then
            //TempENRecordPointProm.add(ENRecordPointPromObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENRecordPointPromEdit.Free;
      frmENRecordPointPromEdit:=nil;
    end;
  finally
    ENRecordPointPromObj.Free;
  end;
end;

procedure TfrmENRecordPointPromShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENRecordPointPromShow.actFilterExecute(Sender: TObject);
begin
frmENRecordPointPromFilterEdit:=TfrmENRecordPointPromFilterEdit.Create(Application, dsEdit);
  try
    ENRecordPointPromFilterObj := ENRecordPointPromFilter.Create;
    SetNullIntProps(ENRecordPointPromFilterObj);
    SetNullXSProps(ENRecordPointPromFilterObj);

    if frmENRecordPointPromFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENRecordPointPromFilter.Create;
      FilterObject := ENRecordPointPromFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENRecordPointPromFilterEdit.Free;
    frmENRecordPointPromFilterEdit:=nil;
  end;
end;

procedure TfrmENRecordPointPromShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.