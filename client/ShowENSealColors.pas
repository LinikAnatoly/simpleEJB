
unit ShowENSealColors;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENSealColorsController, AdvObj ;


type
  TfrmENSealColorsShow = class(TChildForm)  
  HTTPRIOENSealColors: THTTPRIO;
    ImageList1: TImageList;
    sgENSealColors: TAdvStringGrid;
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
procedure sgENSealColorsTopLeftChanged(Sender: TObject);
procedure sgENSealColorsDblClick(Sender: TObject);
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
 frmENSealColorsShow : TfrmENSealColorsShow;
 // ENSealColorsObj: ENSealColors;
 // ENSealColorsFilterObj: ENSealColorsFilter;
  
  
implementation

uses Main, EditENSealColors, EditENSealColorsFilter;


{$R *.dfm}

var
  //frmENSealColorsShow : TfrmENSealColorsShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENSealColorsHeaders: array [1..3] of String =
        ( 'Код'
          ,'Назва'
          ,'Назва матеріалу'
        );
   

procedure TfrmENSealColorsShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENSealColorsShow:=nil;
    inherited;
  end;


procedure TfrmENSealColorsShow.FormShow(Sender: TObject);
var
  TempENSealColors: ENSealColorsControllerSoapPort;
  i: Integer;
  ENSealColorsList: ENSealColorsShortList;
  begin
  SetGridHeaders(ENSealColorsHeaders, sgENSealColors.ColumnHeaders);
  ColCount:=100;
  TempENSealColors :=  HTTPRIOENSealColors as ENSealColorsControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENSealColorsFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSealColorsList := TempENSealColors.getScrollableFilteredList(ENSealColorsFilter(FilterObject),0,ColCount);


  LastCount:=High(ENSealColorsList.list);

  if LastCount > -1 then
     sgENSealColors.RowCount:=LastCount+2
  else
     sgENSealColors.RowCount:=2;

   with sgENSealColors do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSealColorsList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENSealColorsList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENSealColorsList.list[i].name;
        Cells[2,i+1] := ENSealColorsList.list[i].materialRefName + '(' +
                        IntToStr(ENSealColorsList.list[i].materialRefCode) + ')'  ;
        LastRow:=i+1;
        sgENSealColors.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENSealColors.Row:=1;
end;

procedure TfrmENSealColorsShow.sgENSealColorsTopLeftChanged(Sender: TObject);
var
  TempENSealColors: ENSealColorsControllerSoapPort;
  i,CurrentRow: Integer;
  ENSealColorsList: ENSealColorsShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENSealColors.TopRow + sgENSealColors.VisibleRowCount) = ColCount
  then
    begin
      TempENSealColors :=  HTTPRIOENSealColors as ENSealColorsControllerSoapPort;
      CurrentRow:=sgENSealColors.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENSealColorsFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSealColorsList := TempENSealColors.getScrollableFilteredList(ENSealColorsFilter(FilterObject),ColCount-1, 100);



  sgENSealColors.RowCount:=sgENSealColors.RowCount+100;
  LastCount:=High(ENSealColorsList.list);
  with sgENSealColors do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSealColorsList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENSealColorsList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENSealColorsList.list[i].name;
        Cells[2,i+CurrentRow] := ENSealColorsList.list[i].materialRefName + '(' +
                                 IntToStr(ENSealColorsList.list[i].materialRefCode) + ')';
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENSealColors.Row:=CurrentRow-5;
   sgENSealColors.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENSealColorsShow.sgENSealColorsDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENSealColors,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENSealColorsShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENSealColors.RowCount-1 do
   for j:=0 to sgENSealColors.ColCount-1 do
     sgENSealColors.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENSealColorsShow.actViewExecute(Sender: TObject);
Var TempENSealColors: ENSealColorsControllerSoapPort;
begin
 TempENSealColors := HTTPRIOENSealColors as ENSealColorsControllerSoapPort;
   try
     ENSealColorsObj := TempENSealColors.getObject(StrToInt(sgENSealColors.Cells[0,sgENSealColors.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENSealColorsEdit:=TfrmENSealColorsEdit.Create(Application, dsView);
  try
    frmENSealColorsEdit.ShowModal;
  finally
    frmENSealColorsEdit.Free;
    frmENSealColorsEdit:=nil;
  end;
end;

procedure TfrmENSealColorsShow.actEditExecute(Sender: TObject);
Var TempENSealColors: ENSealColorsControllerSoapPort;
begin
 TempENSealColors := HTTPRIOENSealColors as ENSealColorsControllerSoapPort;
   try
     ENSealColorsObj := TempENSealColors.getObject(StrToInt(sgENSealColors.Cells[0,sgENSealColors.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENSealColorsEdit:=TfrmENSealColorsEdit.Create(Application, dsEdit);
  try
    if frmENSealColorsEdit.ShowModal= mrOk then
      begin
        //TempENSealColors.save(ENSealColorsObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENSealColorsEdit.Free;
    frmENSealColorsEdit:=nil;
  end;
end;

procedure TfrmENSealColorsShow.actDeleteExecute(Sender: TObject);
Var TempENSealColors: ENSealColorsControllerSoapPort;
  ObjCode: Integer;
begin
 TempENSealColors := HTTPRIOENSealColors as ENSealColorsControllerSoapPort;
   try
     ObjCode := StrToInt(sgENSealColors.Cells[0,sgENSealColors.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Кольори пломб) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENSealColors.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENSealColorsShow.actInsertExecute(Sender: TObject);
// Var TempENSealColors: ENSealColorsControllerSoapPort; 
begin
  // TempENSealColors := HTTPRIOENSealColors as ENSealColorsControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENSealColorsObj:=ENSealColors.Create;



  try
    frmENSealColorsEdit:=TfrmENSealColorsEdit.Create(Application, dsInsert);
    try
      if frmENSealColorsEdit.ShowModal = mrOk then
      begin
        if ENSealColorsObj<>nil then
            //TempENSealColors.add(ENSealColorsObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENSealColorsEdit.Free;
      frmENSealColorsEdit:=nil;
    end;
  finally
    ENSealColorsObj.Free;
  end;
end;

procedure TfrmENSealColorsShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENSealColorsShow.actFilterExecute(Sender: TObject);
begin
{frmENSealColorsFilterEdit:=TfrmENSealColorsFilterEdit.Create(Application, dsInsert);
  try
    ENSealColorsFilterObj := ENSealColorsFilter.Create;
    SetNullIntProps(ENSealColorsFilterObj);
    SetNullXSProps(ENSealColorsFilterObj);

    if frmENSealColorsFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENSealColorsFilter.Create;
      FilterObject := ENSealColorsFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENSealColorsFilterEdit.Free;
    frmENSealColorsFilterEdit:=nil;
  end;}
end;

procedure TfrmENSealColorsShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.