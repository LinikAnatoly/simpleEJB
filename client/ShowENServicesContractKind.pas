
unit ShowENServicesContractKind;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  ENServicesContractKindController, AdvObj ;


type
    TfrmENServicesContractKindShow = class(TChildForm)  
    HTTPRIOENServicesContractKind: THTTPRIO;
    ImageList1: TImageList;
    sgENServicesContractKind: TAdvStringGrid;
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
    procedure sgENServicesContractKindTopLeftChanged(Sender: TObject);
    procedure sgENServicesContractKindDblClick(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
    procedure actNoFilterExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
   { Private declarations }
   selectedRow : Integer;
 public
   { Public declarations }
   procedure UpdateGrid(Sender: TObject);
   class function chooseFromList() : ENServicesContractKindShort; stdcall; static;
 end;

//var
 // ENServicesContractKindObj: ENServicesContractKind;
 // ENServicesContractKindFilterObj: ENServicesContractKindFilter;
  
  
implementation

uses Main;


{$R *.dfm}

var
  //frmENServicesContractKindShow : TfrmENServicesContractKindShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENServicesContractKindHeaders: array [1..2] of String =
        ( 'Код'
          ,'Вид договору на послуги на сторону'
        );
   
class function TfrmENServicesContractKindShow.chooseFromList() : ENServicesContractKindShort;
var
  f : ENServicesContractKindFilter;
  frmENServicesContractKindShow : TfrmENServicesContractKindShow;
  selectedKind : ENServicesContractKindShort;
begin
  inherited;
     f := ENServicesContractKindFilter.Create;
     SetNullXSProps(f);
     SetNullIntProps(f);
     frmENServicesContractKindShow:=TfrmENServicesContractKindShow.Create(Application,fmNormal, f);
	 selectedKind := nil;
       try
          with frmENServicesContractKindShow do
          begin
            DisableActions([ actEdit, actInsert
              , actDelete]);
            if ShowModal = mrOk then
            begin
                try
                  selectedKind := ENServicesContractKindShort(sgENServicesContractKind.Objects[0, sgENServicesContractKind.Row]);
                except
                   on EConvertError do Exit;
                end;
            end;
          end;
    finally
      frmENServicesContractKindShow.Free;
    end;
	Result := selectedKind;
end;

procedure TfrmENServicesContractKindShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //if FormMode = fmChild then
    //frmENServicesContractKindShow:=nil;
  inherited;
end;


procedure TfrmENServicesContractKindShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmENServicesContractKindShow.FormShow(Sender: TObject);
var
  TempENServicesContractKind: ENServicesContractKindControllerSoapPort;
  i: Integer;
  ENServicesContractKindList: ENServicesContractKindShortList;
begin
  SetGridHeaders(ENServicesContractKindHeaders, sgENServicesContractKind.ColumnHeaders);
  ColCount:=100;
  TempENServicesContractKind :=  HTTPRIOENServicesContractKind as ENServicesContractKindControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENServicesContractKindFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENServicesContractKindList := TempENServicesContractKind.getScrollableFilteredList(ENServicesContractKindFilter(FilterObject),0,ColCount);
  LastCount:=High(ENServicesContractKindList.list);

  if LastCount > -1 then
     sgENServicesContractKind.RowCount:=LastCount+2
  else
     sgENServicesContractKind.RowCount:=2;

   with sgENServicesContractKind do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENServicesContractKindList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENServicesContractKindList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENServicesContractKindList.list[i].name;
		Objects[0,i+1] := ENServicesContractKindList.list[i];
        LastRow:=i+1;
        sgENServicesContractKind.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgENServicesContractKind.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgENServicesContractKind.RowCount > selectedRow then
      sgENServicesContractKind.Row := selectedRow
    else
      sgENServicesContractKind.Row := sgENServicesContractKind.RowCount - 1;
    end
    else
      sgENServicesContractKind.Row:=1;   
end;


procedure TfrmENServicesContractKindShow.sgENServicesContractKindTopLeftChanged(Sender: TObject);
var
  TempENServicesContractKind: ENServicesContractKindControllerSoapPort;
  i,CurrentRow: Integer;
  ENServicesContractKindList: ENServicesContractKindShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENServicesContractKind.TopRow + sgENServicesContractKind.VisibleRowCount) = ColCount
  then
    begin
      TempENServicesContractKind :=  HTTPRIOENServicesContractKind as ENServicesContractKindControllerSoapPort;
      CurrentRow:=sgENServicesContractKind.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENServicesContractKindFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENServicesContractKindList := TempENServicesContractKind.getScrollableFilteredList(ENServicesContractKindFilter(FilterObject),ColCount-1, 100);


  sgENServicesContractKind.RowCount:=sgENServicesContractKind.RowCount+100;
  LastCount:=High(ENServicesContractKindList.list);
  with sgENServicesContractKind do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENServicesContractKindList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENServicesContractKindList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENServicesContractKindList.list[i].name;
		Objects[0,i+CurrentRow] := ENServicesContractKindList.list[i];
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENServicesContractKind.Row:=CurrentRow-5;
   sgENServicesContractKind.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENServicesContractKindShow.sgENServicesContractKindDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENServicesContractKind,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmENServicesContractKindShow.UpdateGrid(Sender: TObject);
var 
  i, j: Integer;
begin
 for i:=1 to sgENServicesContractKind.RowCount-1 do
   for j:=0 to sgENServicesContractKind.ColCount-1 do
     sgENServicesContractKind.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmENServicesContractKindShow.actViewExecute(Sender: TObject);
//var
//  TempENServicesContractKind: ENServicesContractKindControllerSoapPort;
begin
{  TempENServicesContractKind := HTTPRIOENServicesContractKind as ENServicesContractKindControllerSoapPort;
  try
    ENServicesContractKindObj := TempENServicesContractKind.getObject(StrToInt(sgENServicesContractKind.Cells[0,sgENServicesContractKind.Row]));
  except
    on EConvertError do Exit;
  end;

  selectedRow := sgENServicesContractKind.Row;
  frmENServicesContractKindEdit:=TfrmENServicesContractKindEdit.Create(Application, dsView);

  try
    frmENServicesContractKindEdit.ShowModal;
  finally
    frmENServicesContractKindEdit.Free;
    frmENServicesContractKindEdit:=nil;
  end;

  if sgENServicesContractKind.RowCount > selectedRow then
    sgENServicesContractKind.Row := selectedRow
  else
    sgENServicesContractKind.Row := sgENServicesContractKind.RowCount - 1;}

end;


procedure TfrmENServicesContractKindShow.actEditExecute(Sender: TObject);
//var
//  TempENServicesContractKind: ENServicesContractKindControllerSoapPort;
begin
{  TempENServicesContractKind := HTTPRIOENServicesContractKind as ENServicesContractKindControllerSoapPort;
  try
    ENServicesContractKindObj := TempENServicesContractKind.getObject(StrToInt(sgENServicesContractKind.Cells[0,sgENServicesContractKind.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENServicesContractKind.Row;
  frmENServicesContractKindEdit:=TfrmENServicesContractKindEdit.Create(Application, dsEdit);
  
  try
    if frmENServicesContractKindEdit.ShowModal= mrOk then
      begin
        //TempENServicesContractKind.save(ENServicesContractKindObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENServicesContractKindEdit.Free;
    frmENServicesContractKindEdit:=nil;
  end;

  if sgENServicesContractKind.RowCount > selectedRow then
    sgENServicesContractKind.Row := selectedRow
  else
    sgENServicesContractKind.Row := sgENServicesContractKind.RowCount - 1;
}
end;


procedure TfrmENServicesContractKindShow.actDeleteExecute(Sender: TObject);
//Var TempENServicesContractKind: ENServicesContractKindControllerSoapPort;
//  ObjCode: Integer;
begin
{ TempENServicesContractKind := HTTPRIOENServicesContractKind as ENServicesContractKindControllerSoapPort;
   try
     ObjCode := StrToInt(sgENServicesContractKind.Cells[0,sgENServicesContractKind.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Вид договору на послуги на сторону) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENServicesContractKind.remove(ObjCode);
      UpdateGrid(Sender);
  end;}
end;

procedure TfrmENServicesContractKindShow.actInsertExecute(Sender: TObject);
// Var TempENServicesContractKind: ENServicesContractKindControllerSoapPort; 
begin
 { // TempENServicesContractKind := HTTPRIOENServicesContractKind as ENServicesContractKindControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENServicesContractKindObj:=ENServicesContractKind.Create;
  SetNullIntProps(ENServicesContractKindObj);
  SetNullXSProps(ENServicesContractKindObj);



  try
    frmENServicesContractKindEdit:=TfrmENServicesContractKindEdit.Create(Application, dsInsert);
    try
      if frmENServicesContractKindEdit.ShowModal = mrOk then
      begin
        if ENServicesContractKindObj<>nil then
            //TempENServicesContractKind.add(ENServicesContractKindObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENServicesContractKindEdit.Free;
      frmENServicesContractKindEdit:=nil;
    end;
  finally
    ENServicesContractKindObj.Free;
  end;}
end;


procedure TfrmENServicesContractKindShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmENServicesContractKindShow.actFilterExecute(Sender: TObject);
begin
{frmENServicesContractKindFilterEdit:=TfrmENServicesContractKindFilterEdit.Create(Application, dsInsert);
  try
    ENServicesContractKindFilterObj := ENServicesContractKindFilter.Create;
    SetNullIntProps(ENServicesContractKindFilterObj);
    SetNullXSProps(ENServicesContractKindFilterObj);

    if frmENServicesContractKindFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      //FilterObject := ENServicesContractKindFilter.Create;
      FilterObject := ENServicesContractKindFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENServicesContractKindFilterEdit.Free;
    frmENServicesContractKindFilterEdit:=nil;
  end;}
end;


procedure TfrmENServicesContractKindShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
  UpdateGrid(Sender);
end;

end.