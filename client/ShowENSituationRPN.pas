
unit ShowENSituationRPN;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENSituationRPNController ;


type
  TfrmENSituationRPNShow = class(TChildForm)  
  HTTPRIOENSituationRPN: THTTPRIO;
    ImageList1: TImageList;
    sgENSituationRPN: TAdvStringGrid;
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
procedure sgENSituationRPNTopLeftChanged(Sender: TObject);
procedure sgENSituationRPNDblClick(Sender: TObject);
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
 // ENSituationRPNObj: ENSituationRPN;
 // ENSituationRPNFilterObj: ENSituationRPNFilter;
  
  
implementation

uses Main, EditENSituationRPN, EditENSituationRPNFilter;


{$R *.dfm}

var
  //frmENSituationRPNShow : TfrmENSituationRPNShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENSituationRPNHeaders: array [1..3] of String =
        ( 'Код'
          ,'Положение РПН'
          ,'Описание'
        );
   

procedure TfrmENSituationRPNShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENSituationRPNShow:=nil;
    inherited;
  end;


procedure TfrmENSituationRPNShow.FormShow(Sender: TObject);
var
  TempENSituationRPN: ENSituationRPNControllerSoapPort;
  i: Integer;
  ENSituationRPNList: ENSituationRPNShortList;
  begin
  SetGridHeaders(ENSituationRPNHeaders, sgENSituationRPN.ColumnHeaders);
  ColCount:=100;
  TempENSituationRPN :=  HTTPRIOENSituationRPN as ENSituationRPNControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENSituationRPNFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSituationRPNList := TempENSituationRPN.getScrollableFilteredList(ENSituationRPNFilter(FilterObject),0,ColCount);


  LastCount:=High(ENSituationRPNList.list);

  if LastCount > -1 then
     sgENSituationRPN.RowCount:=LastCount+2
  else
     sgENSituationRPN.RowCount:=2;

   with sgENSituationRPN do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSituationRPNList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENSituationRPNList.list[i].code)
        else
        Cells[0,i+1] := '';
        if ENSituationRPNList.list[i].value = Low(Integer) then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := IntToStr(ENSituationRPNList.list[i].value);
        Cells[2,i+1] := ENSituationRPNList.list[i].description;
        LastRow:=i+1;
        sgENSituationRPN.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENSituationRPN.Row:=1;
end;

procedure TfrmENSituationRPNShow.sgENSituationRPNTopLeftChanged(Sender: TObject);
var
  TempENSituationRPN: ENSituationRPNControllerSoapPort;
  i,CurrentRow: Integer;
  ENSituationRPNList: ENSituationRPNShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENSituationRPN.TopRow + sgENSituationRPN.VisibleRowCount) = ColCount
  then
    begin
      TempENSituationRPN :=  HTTPRIOENSituationRPN as ENSituationRPNControllerSoapPort;
      CurrentRow:=sgENSituationRPN.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENSituationRPNFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSituationRPNList := TempENSituationRPN.getScrollableFilteredList(ENSituationRPNFilter(FilterObject),ColCount-1, 100);



  sgENSituationRPN.RowCount:=sgENSituationRPN.RowCount+100;
  LastCount:=High(ENSituationRPNList.list);
  with sgENSituationRPN do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSituationRPNList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENSituationRPNList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        if ENSituationRPNList.list[i].value = Low(Integer) then
          Cells[1,i+CurrentRow] := ''
        else
          Cells[1,i+CurrentRow] := IntToStr(ENSituationRPNList.list[i].value);
        Cells[2,i+CurrentRow] := ENSituationRPNList.list[i].description;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENSituationRPN.Row:=CurrentRow-5;
   sgENSituationRPN.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENSituationRPNShow.sgENSituationRPNDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENSituationRPN,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENSituationRPNShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENSituationRPN.RowCount-1 do
   for j:=0 to sgENSituationRPN.ColCount-1 do
     sgENSituationRPN.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENSituationRPNShow.actViewExecute(Sender: TObject);
Var TempENSituationRPN: ENSituationRPNControllerSoapPort;
begin
 TempENSituationRPN := HTTPRIOENSituationRPN as ENSituationRPNControllerSoapPort;
   try
     ENSituationRPNObj := TempENSituationRPN.getObject(StrToInt(sgENSituationRPN.Cells[0,sgENSituationRPN.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENSituationRPNEdit:=TfrmENSituationRPNEdit.Create(Application, dsView);
  try
    frmENSituationRPNEdit.ShowModal;
  finally
    frmENSituationRPNEdit.Free;
    frmENSituationRPNEdit:=nil;
  end;
end;

procedure TfrmENSituationRPNShow.actEditExecute(Sender: TObject);
Var TempENSituationRPN: ENSituationRPNControllerSoapPort;
begin
 TempENSituationRPN := HTTPRIOENSituationRPN as ENSituationRPNControllerSoapPort;
   try
     ENSituationRPNObj := TempENSituationRPN.getObject(StrToInt(sgENSituationRPN.Cells[0,sgENSituationRPN.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENSituationRPNEdit:=TfrmENSituationRPNEdit.Create(Application, dsEdit);
  try
    if frmENSituationRPNEdit.ShowModal= mrOk then
      begin
        //TempENSituationRPN.save(ENSituationRPNObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENSituationRPNEdit.Free;
    frmENSituationRPNEdit:=nil;
  end;
end;

procedure TfrmENSituationRPNShow.actDeleteExecute(Sender: TObject);
Var TempENSituationRPN: ENSituationRPNControllerSoapPort;
  ObjCode: Integer;
begin
 TempENSituationRPN := HTTPRIOENSituationRPN as ENSituationRPNControllerSoapPort;
   try
     ObjCode := StrToInt(sgENSituationRPN.Cells[0,sgENSituationRPN.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Положения РПН) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENSituationRPN.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENSituationRPNShow.actInsertExecute(Sender: TObject);
// Var TempENSituationRPN: ENSituationRPNControllerSoapPort; 
begin
  // TempENSituationRPN := HTTPRIOENSituationRPN as ENSituationRPNControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENSituationRPNObj:=ENSituationRPN.Create;



  try
    frmENSituationRPNEdit:=TfrmENSituationRPNEdit.Create(Application, dsInsert);
    try
      if frmENSituationRPNEdit.ShowModal = mrOk then
      begin
        if ENSituationRPNObj<>nil then
            //TempENSituationRPN.add(ENSituationRPNObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENSituationRPNEdit.Free;
      frmENSituationRPNEdit:=nil;
    end;
  finally
    ENSituationRPNObj.Free;
  end;
end;

procedure TfrmENSituationRPNShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENSituationRPNShow.actFilterExecute(Sender: TObject);
begin
{frmENSituationRPNFilterEdit:=TfrmENSituationRPNFilterEdit.Create(Application, dsInsert);
  try
    ENSituationRPNFilterObj := ENSituationRPNFilter.Create;
    SetNullIntProps(ENSituationRPNFilterObj);
    SetNullXSProps(ENSituationRPNFilterObj);

    if frmENSituationRPNFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENSituationRPNFilter.Create;
      FilterObject := ENSituationRPNFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENSituationRPNFilterEdit.Free;
    frmENSituationRPNFilterEdit:=nil;
  end;}
end;

procedure TfrmENSituationRPNShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.