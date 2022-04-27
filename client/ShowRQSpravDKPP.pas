
unit ShowRQSpravDKPP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  RQSpravDKPPController, AdvObj ;


type
  TfrmRQSpravDKPPShow = class(TChildForm)
    ImageList1: TImageList;
    sgRQSpravDKPP: TAdvStringGrid;
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
    HTTPRIORQSpravDKPP: THTTPRIO;

procedure FormShow(Sender: TObject);
procedure FormClose(Sender: TObject; var Action: TCloseAction);
procedure sgRQSpravDKPPTopLeftChanged(Sender: TObject);
procedure sgRQSpravDKPPDblClick(Sender: TObject);
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
 // RQSpravDKPPObj: RQSpravDKPP;
 // RQSpravDKPPFilterObj: RQSpravDKPPFilter;
  
  
implementation

uses Main, EditRQSpravDKPP, EditRQSpravDKPPFilter;


{$R *.dfm}

var
  //frmRQSpravDKPPShow : TfrmRQSpravDKPPShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  RQSpravDKPPHeaders: array [1..2] of String =
        ( 'Код'
          ,'Назва'
        );
   

procedure TfrmRQSpravDKPPShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmRQSpravDKPPShow:=nil;
    inherited;
  end;


procedure TfrmRQSpravDKPPShow.FormShow(Sender: TObject);
var
  TempRQSpravDKPP: RQSpravDKPPControllerSoapPort;
  i: Integer;
  RQSpravDKPPList: RQSpravDKPPShortList;
  begin
  SetGridHeaders(RQSpravDKPPHeaders, sgRQSpravDKPP.ColumnHeaders);
  ColCount:=100;
  TempRQSpravDKPP :=  HTTPRIORQSpravDKPP as RQSpravDKPPControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := RQSpravDKPPFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQSpravDKPPList := TempRQSpravDKPP.getScrollableFilteredList(RQSpravDKPPFilter(FilterObject),0,ColCount);


  LastCount:=High(RQSpravDKPPList.list);

  if LastCount > -1 then
     sgRQSpravDKPP.RowCount:=LastCount+2
  else
     sgRQSpravDKPP.RowCount:=2;

   with sgRQSpravDKPP do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQSpravDKPPList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQSpravDKPPList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := RQSpravDKPPList.list[i].name;
        LastRow:=i+1;
        sgRQSpravDKPP.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgRQSpravDKPP.Row:=1;
end;

procedure TfrmRQSpravDKPPShow.sgRQSpravDKPPTopLeftChanged(Sender: TObject);
var
  TempRQSpravDKPP: RQSpravDKPPControllerSoapPort;
  i,CurrentRow: Integer;
  RQSpravDKPPList: RQSpravDKPPShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgRQSpravDKPP.TopRow + sgRQSpravDKPP.VisibleRowCount) = ColCount
  then
    begin
      TempRQSpravDKPP :=  HTTPRIORQSpravDKPP as RQSpravDKPPControllerSoapPort;
      CurrentRow:=sgRQSpravDKPP.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := RQSpravDKPPFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQSpravDKPPList := TempRQSpravDKPP.getScrollableFilteredList(RQSpravDKPPFilter(FilterObject),ColCount-1, 100);



  sgRQSpravDKPP.RowCount:=sgRQSpravDKPP.RowCount+100;
  LastCount:=High(RQSpravDKPPList.list);
  with sgRQSpravDKPP do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQSpravDKPPList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(RQSpravDKPPList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := RQSpravDKPPList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgRQSpravDKPP.Row:=CurrentRow-5;
   sgRQSpravDKPP.RowCount:=LastRow+1;
  end;
end;

procedure TfrmRQSpravDKPPShow.sgRQSpravDKPPDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgRQSpravDKPP,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmRQSpravDKPPShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgRQSpravDKPP.RowCount-1 do
   for j:=0 to sgRQSpravDKPP.ColCount-1 do
     sgRQSpravDKPP.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmRQSpravDKPPShow.actViewExecute(Sender: TObject);
Var TempRQSpravDKPP: RQSpravDKPPControllerSoapPort;
begin
 TempRQSpravDKPP := HTTPRIORQSpravDKPP as RQSpravDKPPControllerSoapPort;
   try
     RQSpravDKPPObj := TempRQSpravDKPP.getObject(StrToInt(sgRQSpravDKPP.Cells[0,sgRQSpravDKPP.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQSpravDKPPEdit:=TfrmRQSpravDKPPEdit.Create(Application, dsView);
  try
    frmRQSpravDKPPEdit.ShowModal;
  finally
    frmRQSpravDKPPEdit.Free;
    frmRQSpravDKPPEdit:=nil;
  end;
end;

procedure TfrmRQSpravDKPPShow.actEditExecute(Sender: TObject);
Var TempRQSpravDKPP: RQSpravDKPPControllerSoapPort;
begin
 TempRQSpravDKPP := HTTPRIORQSpravDKPP as RQSpravDKPPControllerSoapPort;
   try
     RQSpravDKPPObj := TempRQSpravDKPP.getObject(StrToInt(sgRQSpravDKPP.Cells[0,sgRQSpravDKPP.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQSpravDKPPEdit:=TfrmRQSpravDKPPEdit.Create(Application, dsEdit);
  try
    if frmRQSpravDKPPEdit.ShowModal= mrOk then
      begin
        //TempRQSpravDKPP.save(RQSpravDKPPObj);
        UpdateGrid(Sender);
      end;
  finally
    frmRQSpravDKPPEdit.Free;
    frmRQSpravDKPPEdit:=nil;
  end;
end;

procedure TfrmRQSpravDKPPShow.actDeleteExecute(Sender: TObject);
Var TempRQSpravDKPP: RQSpravDKPPControllerSoapPort;
  ObjCode: Integer;
begin
 TempRQSpravDKPP := HTTPRIORQSpravDKPP as RQSpravDKPPControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQSpravDKPP.Cells[0,sgRQSpravDKPP.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Довідник державних класифікаторів продукції та послуг) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQSpravDKPP.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmRQSpravDKPPShow.actInsertExecute(Sender: TObject);
// Var TempRQSpravDKPP: RQSpravDKPPControllerSoapPort; 
begin
  // TempRQSpravDKPP := HTTPRIORQSpravDKPP as RQSpravDKPPControllerSoapPort;  /// Это здесь уже лишнее!!!
  RQSpravDKPPObj:=RQSpravDKPP.Create;



  try
    frmRQSpravDKPPEdit:=TfrmRQSpravDKPPEdit.Create(Application, dsInsert);
    try
      if frmRQSpravDKPPEdit.ShowModal = mrOk then
      begin
        if RQSpravDKPPObj<>nil then
            //TempRQSpravDKPP.add(RQSpravDKPPObj);
            UpdateGrid(Sender);
      end;
    finally
      frmRQSpravDKPPEdit.Free;
      frmRQSpravDKPPEdit:=nil;
    end;
  finally
    RQSpravDKPPObj.Free;
  end;
end;

procedure TfrmRQSpravDKPPShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmRQSpravDKPPShow.actFilterExecute(Sender: TObject);
begin
{frmRQSpravDKPPFilterEdit:=TfrmRQSpravDKPPFilterEdit.Create(Application, dsInsert);
  try
    RQSpravDKPPFilterObj := RQSpravDKPPFilter.Create;
    SetNullIntProps(RQSpravDKPPFilterObj);
    SetNullXSProps(RQSpravDKPPFilterObj);

    if frmRQSpravDKPPFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := RQSpravDKPPFilter.Create;
      FilterObject := RQSpravDKPPFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmRQSpravDKPPFilterEdit.Free;
    frmRQSpravDKPPFilterEdit:=nil;
  end;}
end;

procedure TfrmRQSpravDKPPShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.