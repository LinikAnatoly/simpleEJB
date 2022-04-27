
unit ShowENSealNames;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENSealNamesController, AdvObj ;


type
  TfrmENSealNamesShow = class(TChildForm)  
  HTTPRIOENSealNames: THTTPRIO;
    ImageList1: TImageList;
    sgENSealNames: TAdvStringGrid;
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
procedure sgENSealNamesTopLeftChanged(Sender: TObject);
procedure sgENSealNamesDblClick(Sender: TObject);
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
 frmENSealNamesShow : TfrmENSealNamesShow;
 // ENSealNamesObj: ENSealNames;
 // ENSealNamesFilterObj: ENSealNamesFilter;
  
  
implementation

uses Main, EditENSealNames, EditENSealNamesFilter;


{$R *.dfm}

var
  //frmENSealNamesShow : TfrmENSealNamesShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENSealNamesHeaders: array [1..3] of String =
        ( 'Код'
          ,'Назва'
          ,'Назва матеріалу'
        );
   

procedure TfrmENSealNamesShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENSealNamesShow:=nil;
    inherited;
  end;


procedure TfrmENSealNamesShow.FormShow(Sender: TObject);
var
  TempENSealNames: ENSealNamesControllerSoapPort;
  i: Integer;
  ENSealNamesList: ENSealNamesShortList;
  begin
  SetGridHeaders(ENSealNamesHeaders, sgENSealNames.ColumnHeaders);
  ColCount:=100;
  TempENSealNames :=  HTTPRIOENSealNames as ENSealNamesControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENSealNamesFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSealNamesList := TempENSealNames.getScrollableFilteredList(ENSealNamesFilter(FilterObject),0,ColCount);


  LastCount:=High(ENSealNamesList.list);

  if LastCount > -1 then
     sgENSealNames.RowCount:=LastCount+2
  else
     sgENSealNames.RowCount:=2;

   with sgENSealNames do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSealNamesList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENSealNamesList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENSealNamesList.list[i].name;
        Cells[2,i+1] := ENSealNamesList.list[i].materialRefName + '(' +
                        IntToStr(ENSealNamesList.list[i].materialRefCode) + ')'  ;
        LastRow:=i+1;
        sgENSealNames.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENSealNames.Row:=1;
end;

procedure TfrmENSealNamesShow.sgENSealNamesTopLeftChanged(Sender: TObject);
var
  TempENSealNames: ENSealNamesControllerSoapPort;
  i,CurrentRow: Integer;
  ENSealNamesList: ENSealNamesShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENSealNames.TopRow + sgENSealNames.VisibleRowCount) = ColCount
  then
    begin
      TempENSealNames :=  HTTPRIOENSealNames as ENSealNamesControllerSoapPort;
      CurrentRow:=sgENSealNames.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENSealNamesFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSealNamesList := TempENSealNames.getScrollableFilteredList(ENSealNamesFilter(FilterObject),ColCount-1, 100);



  sgENSealNames.RowCount:=sgENSealNames.RowCount+100;
  LastCount:=High(ENSealNamesList.list);
  with sgENSealNames do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSealNamesList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENSealNamesList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENSealNamesList.list[i].name;
        Cells[2,i+CurrentRow] := ENSealNamesList.list[i].materialRefName + '(' +
                                 IntToStr(ENSealNamesList.list[i].materialRefCode) + ')'  ;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENSealNames.Row:=CurrentRow-5;
   sgENSealNames.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENSealNamesShow.sgENSealNamesDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENSealNames,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENSealNamesShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENSealNames.RowCount-1 do
   for j:=0 to sgENSealNames.ColCount-1 do
     sgENSealNames.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENSealNamesShow.actViewExecute(Sender: TObject);
Var TempENSealNames: ENSealNamesControllerSoapPort;
begin
 TempENSealNames := HTTPRIOENSealNames as ENSealNamesControllerSoapPort;
   try
     ENSealNamesObj := TempENSealNames.getObject(StrToInt(sgENSealNames.Cells[0,sgENSealNames.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENSealNamesEdit:=TfrmENSealNamesEdit.Create(Application, dsView);
  try
    frmENSealNamesEdit.ShowModal;
  finally
    frmENSealNamesEdit.Free;
    frmENSealNamesEdit:=nil;
  end;
end;

procedure TfrmENSealNamesShow.actEditExecute(Sender: TObject);
Var TempENSealNames: ENSealNamesControllerSoapPort;
begin
 TempENSealNames := HTTPRIOENSealNames as ENSealNamesControllerSoapPort;
   try
     ENSealNamesObj := TempENSealNames.getObject(StrToInt(sgENSealNames.Cells[0,sgENSealNames.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENSealNamesEdit:=TfrmENSealNamesEdit.Create(Application, dsEdit);
  try
    if frmENSealNamesEdit.ShowModal= mrOk then
      begin
        //TempENSealNames.save(ENSealNamesObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENSealNamesEdit.Free;
    frmENSealNamesEdit:=nil;
  end;
end;

procedure TfrmENSealNamesShow.actDeleteExecute(Sender: TObject);
Var TempENSealNames: ENSealNamesControllerSoapPort;
  ObjCode: Integer;
begin
 TempENSealNames := HTTPRIOENSealNames as ENSealNamesControllerSoapPort;
   try
     ObjCode := StrToInt(sgENSealNames.Cells[0,sgENSealNames.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Найменування пломб) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENSealNames.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENSealNamesShow.actInsertExecute(Sender: TObject);
// Var TempENSealNames: ENSealNamesControllerSoapPort; 
begin
  // TempENSealNames := HTTPRIOENSealNames as ENSealNamesControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENSealNamesObj:=ENSealNames.Create;



  try
    frmENSealNamesEdit:=TfrmENSealNamesEdit.Create(Application, dsInsert);
    try
      if frmENSealNamesEdit.ShowModal = mrOk then
      begin
        if ENSealNamesObj<>nil then
            //TempENSealNames.add(ENSealNamesObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENSealNamesEdit.Free;
      frmENSealNamesEdit:=nil;
    end;
  finally
    ENSealNamesObj.Free;
  end;
end;

procedure TfrmENSealNamesShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENSealNamesShow.actFilterExecute(Sender: TObject);
begin
{frmENSealNamesFilterEdit:=TfrmENSealNamesFilterEdit.Create(Application, dsInsert);
  try
    ENSealNamesFilterObj := ENSealNamesFilter.Create;
    SetNullIntProps(ENSealNamesFilterObj);
    SetNullXSProps(ENSealNamesFilterObj);

    if frmENSealNamesFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENSealNamesFilter.Create;
      FilterObject := ENSealNamesFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENSealNamesFilterEdit.Free;
    frmENSealNamesFilterEdit:=nil;
  end;}
end;

procedure TfrmENSealNamesShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.