
unit ShowRQFKBSDescription;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  RQFKBSDescriptionController, AdvObj ;


type
  TfrmRQFKBSDescriptionShow = class(TChildForm)  
  HTTPRIORQFKBSDescription: THTTPRIO;
    ImageList1: TImageList;
    sgRQFKBSDescription: TAdvStringGrid;
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
procedure sgRQFKBSDescriptionTopLeftChanged(Sender: TObject);
procedure sgRQFKBSDescriptionDblClick(Sender: TObject);
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
 frmRQFKBSDescriptionShow : TfrmRQFKBSDescriptionShow;
 // RQFKBSDescriptionObj: RQFKBSDescription;
 // RQFKBSDescriptionFilterObj: RQFKBSDescriptionFilter;
  
  
implementation

uses Main, EditRQFKBSDescription, EditRQFKBSDescriptionFilter;


{$R *.dfm}

var
  //frmRQFKBSDescriptionShow : TfrmRQFKBSDescriptionShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  RQFKBSDescriptionHeaders: array [1..2] of String =
        ( 'Код'
          ,'Назва'
        );
   

procedure TfrmRQFKBSDescriptionShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmRQFKBSDescriptionShow:=nil;
    inherited;
  end;


procedure TfrmRQFKBSDescriptionShow.FormShow(Sender: TObject);
var
  TempRQFKBSDescription: RQFKBSDescriptionControllerSoapPort;
  i: Integer;
  RQFKBSDescriptionList: RQFKBSDescriptionShortList;
  begin
  SetGridHeaders(RQFKBSDescriptionHeaders, sgRQFKBSDescription.ColumnHeaders);
  ColCount:=100;
  TempRQFKBSDescription :=  HTTPRIORQFKBSDescription as RQFKBSDescriptionControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := RQFKBSDescriptionFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQFKBSDescriptionList := TempRQFKBSDescription.getScrollableFilteredList(RQFKBSDescriptionFilter(FilterObject),0,ColCount);


  LastCount:=High(RQFKBSDescriptionList.list);

  if LastCount > -1 then
     sgRQFKBSDescription.RowCount:=LastCount+2
  else
     sgRQFKBSDescription.RowCount:=2;

   with sgRQFKBSDescription do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQFKBSDescriptionList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQFKBSDescriptionList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := RQFKBSDescriptionList.list[i].name;
        LastRow:=i+1;
        sgRQFKBSDescription.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgRQFKBSDescription.Row:=1;
end;

procedure TfrmRQFKBSDescriptionShow.sgRQFKBSDescriptionTopLeftChanged(Sender: TObject);
var
  TempRQFKBSDescription: RQFKBSDescriptionControllerSoapPort;
  i,CurrentRow: Integer;
  RQFKBSDescriptionList: RQFKBSDescriptionShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgRQFKBSDescription.TopRow + sgRQFKBSDescription.VisibleRowCount) = ColCount
  then
    begin
      TempRQFKBSDescription :=  HTTPRIORQFKBSDescription as RQFKBSDescriptionControllerSoapPort;
      CurrentRow:=sgRQFKBSDescription.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := RQFKBSDescriptionFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQFKBSDescriptionList := TempRQFKBSDescription.getScrollableFilteredList(RQFKBSDescriptionFilter(FilterObject),ColCount-1, 100);



  sgRQFKBSDescription.RowCount:=sgRQFKBSDescription.RowCount+100;
  LastCount:=High(RQFKBSDescriptionList.list);
  with sgRQFKBSDescription do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQFKBSDescriptionList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(RQFKBSDescriptionList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := RQFKBSDescriptionList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgRQFKBSDescription.Row:=CurrentRow-5;
   sgRQFKBSDescription.RowCount:=LastRow+1;
  end;
end;

procedure TfrmRQFKBSDescriptionShow.sgRQFKBSDescriptionDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgRQFKBSDescription,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmRQFKBSDescriptionShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgRQFKBSDescription.RowCount-1 do
   for j:=0 to sgRQFKBSDescription.ColCount-1 do
     sgRQFKBSDescription.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmRQFKBSDescriptionShow.actViewExecute(Sender: TObject);
Var TempRQFKBSDescription: RQFKBSDescriptionControllerSoapPort;
begin
 TempRQFKBSDescription := HTTPRIORQFKBSDescription as RQFKBSDescriptionControllerSoapPort;
   try
     RQFKBSDescriptionObj := TempRQFKBSDescription.getObject(StrToInt(sgRQFKBSDescription.Cells[0,sgRQFKBSDescription.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQFKBSDescriptionEdit:=TfrmRQFKBSDescriptionEdit.Create(Application, dsView);
  try
    frmRQFKBSDescriptionEdit.ShowModal;
  finally
    frmRQFKBSDescriptionEdit.Free;
    frmRQFKBSDescriptionEdit:=nil;
  end;
end;

procedure TfrmRQFKBSDescriptionShow.actEditExecute(Sender: TObject);
Var TempRQFKBSDescription: RQFKBSDescriptionControllerSoapPort;
begin
 TempRQFKBSDescription := HTTPRIORQFKBSDescription as RQFKBSDescriptionControllerSoapPort;
   try
     RQFKBSDescriptionObj := TempRQFKBSDescription.getObject(StrToInt(sgRQFKBSDescription.Cells[0,sgRQFKBSDescription.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQFKBSDescriptionEdit:=TfrmRQFKBSDescriptionEdit.Create(Application, dsEdit);
  try
    if frmRQFKBSDescriptionEdit.ShowModal= mrOk then
      begin
        //TempRQFKBSDescription.save(RQFKBSDescriptionObj);
        UpdateGrid(Sender);
      end;
  finally
    frmRQFKBSDescriptionEdit.Free;
    frmRQFKBSDescriptionEdit:=nil;
  end;
end;

procedure TfrmRQFKBSDescriptionShow.actDeleteExecute(Sender: TObject);
Var TempRQFKBSDescription: RQFKBSDescriptionControllerSoapPort;
  ObjCode: Integer;
begin
 TempRQFKBSDescription := HTTPRIORQFKBSDescription as RQFKBSDescriptionControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQFKBSDescription.Cells[0,sgRQFKBSDescription.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Опис для типів банківських послуг) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQFKBSDescription.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmRQFKBSDescriptionShow.actInsertExecute(Sender: TObject);
Var TempRQFKBSDescription: RQFKBSDescriptionControllerSoapPort;
begin
  TempRQFKBSDescription := HTTPRIORQFKBSDescription as RQFKBSDescriptionControllerSoapPort;
  RQFKBSDescriptionObj:=RQFKBSDescription.Create;



  try
    frmRQFKBSDescriptionEdit:=TfrmRQFKBSDescriptionEdit.Create(Application, dsInsert);
    try
      if frmRQFKBSDescriptionEdit.ShowModal = mrOk then
      begin
        if RQFKBSDescriptionObj<>nil then
            //TempRQFKBSDescription.add(RQFKBSDescriptionObj);
            UpdateGrid(Sender);
      end;
    finally
      frmRQFKBSDescriptionEdit.Free;
      frmRQFKBSDescriptionEdit:=nil;
    end;
  finally
    RQFKBSDescriptionObj.Free;
  end;
end;

procedure TfrmRQFKBSDescriptionShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmRQFKBSDescriptionShow.actFilterExecute(Sender: TObject);
begin
{frmRQFKBSDescriptionFilterEdit:=TfrmRQFKBSDescriptionFilterEdit.Create(Application, dsInsert);
  try
    RQFKBSDescriptionFilterObj := RQFKBSDescriptionFilter.Create;
    SetNullIntProps(RQFKBSDescriptionFilterObj);
    SetNullXSProps(RQFKBSDescriptionFilterObj);

    if frmRQFKBSDescriptionFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := RQFKBSDescriptionFilter.Create;
      FilterObject := RQFKBSDescriptionFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmRQFKBSDescriptionFilterEdit.Free;
    frmRQFKBSDescriptionFilterEdit:=nil;
  end;}
end;

procedure TfrmRQFKBSDescriptionShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.