
unit ShowRQDDSCodes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  RQDDSCodesController, treelist, AdvObj ;


type
  TfrmRQDDSCodesShow = class(TChildForm)  
  HTTPRIORQDDSCodes: THTTPRIO;
    ImageList1: TImageList;
    sgRQDDSCodes: TAdvStringGrid;
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
    tvDDSCodes: TTreeList;
    actSelect: TAction;
    ToolButton4: TToolButton;

procedure FormShow(Sender: TObject);
procedure FormClose(Sender: TObject; var Action: TCloseAction);
procedure sgRQDDSCodesTopLeftChanged(Sender: TObject);
procedure sgRQDDSCodesDblClick(Sender: TObject);
procedure actViewExecute(Sender: TObject);
procedure actEditExecute(Sender: TObject);
procedure actDeleteExecute(Sender: TObject);
procedure actInsertExecute(Sender: TObject);
procedure actUpdateExecute(Sender: TObject);
procedure actFilterExecute(Sender: TObject);
procedure actNoFilterExecute(Sender: TObject);
    procedure tvDDSCodesDblClick(Sender: TObject);
    procedure actSelectExecute(Sender: TObject);

  private
   { Private declarations }
 public
   { Public declarations }
   procedure UpdateGrid(Sender: TObject);
 end;

var
 frmRQDDSCodesShow : TfrmRQDDSCodesShow;
 // RQDDSCodesObj: RQDDSCodes;
 // RQDDSCodesFilterObj: RQDDSCodesFilter;
  
  
implementation

uses Main, EditRQDDSCodes, EditRQDDSCodesFilter;


{$R *.dfm}

var
  //frmRQDDSCodesShow : TfrmRQDDSCodesShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  RQDDSCodesHeaders: array [1..4] of String =
        ( 'Код'
          ,'Назва шифру затрат'
          ,'ліміт по ТМЦ (інвест програма?)'
          ,'Діючий?'
        );
   

procedure TfrmRQDDSCodesShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmRQDDSCodesShow:=nil;
    inherited;
  end;


procedure TfrmRQDDSCodesShow.FormShow(Sender: TObject);
var
  TempRQDDSCodes: RQDDSCodesControllerSoapPort;
  i: Integer;
  RQDDSCodesList: RQDDSCodesShortList;
  isInvest : String;
  begin
  //SetGridHeaders(RQDDSCodesHeaders, sgRQDDSCodes.ColumnHeaders);

  DisableActions([actInsert, actEdit, actDelete, actFilter, actNoFilter]);

  tvDDSCodes.Selected := nil;
  tvDDSCodesDblClick(Sender);

{*******
  ColCount:=100;
  TempRQDDSCodes :=  HTTPRIORQDDSCodes as RQDDSCodesControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := RQDDSCodesFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
     RQDDSCodesFilter(FilterObject).isActual := 1;
     RQDDSCodesFilter(FilterObject).conditionSQL := 'q1.PARENTDDSCODESREFCODE is null';
  end;

  RQDDSCodesList := TempRQDDSCodes.getScrollableFilteredList(RQDDSCodesFilter(FilterObject),0,-1);

  tvDDSCodes.Items.Clear;
    for i:=0 to High(RQDDSCodesList.list) do
      begin
        ///////
        if  RQDDSCodesList.list[i].isInvest = 1 then
           isInvest := 'Так'
        else
           isInvest := 'Ні';

        tvDDSCodes.Items.AddChild(nil, RQDDSCodesList.list[i].txtCode + ';;;;;' + RQDDSCodesList.list[i].name + ';;;;;' + isInvest ).Data := RQDDSCodesList.list[i];
      end;
*******}


{
  LastCount:=High(RQDDSCodesList.list);

  if LastCount > -1 then
     sgRQDDSCodes.RowCount:=LastCount+2
  else
     sgRQDDSCodes.RowCount:=2;

   with sgRQDDSCodes do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQDDSCodesList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQDDSCodesList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := RQDDSCodesList.list[i].name;
        if RQDDSCodesList.list[i].isInvest = Low(Integer) then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := IntToStr(RQDDSCodesList.list[i].isInvest);
        if RQDDSCodesList.list[i].isActual = Low(Integer) then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := IntToStr(RQDDSCodesList.list[i].isActual);
        LastRow:=i+1;
        sgRQDDSCodes.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgRQDDSCodes.Row:=1;
}

end;

procedure TfrmRQDDSCodesShow.sgRQDDSCodesTopLeftChanged(Sender: TObject);
var
  TempRQDDSCodes: RQDDSCodesControllerSoapPort;
  i,CurrentRow: Integer;
  RQDDSCodesList: RQDDSCodesShortList;
  begin
{
  if LastCount < 99 then Exit;
  if (sgRQDDSCodes.TopRow + sgRQDDSCodes.VisibleRowCount) = ColCount
  then
    begin
      TempRQDDSCodes :=  HTTPRIORQDDSCodes as RQDDSCodesControllerSoapPort;
      CurrentRow:=sgRQDDSCodes.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := RQDDSCodesFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQDDSCodesList := TempRQDDSCodes.getScrollableFilteredList(RQDDSCodesFilter(FilterObject),ColCount-1, 100);



  sgRQDDSCodes.RowCount:=sgRQDDSCodes.RowCount+100;
  LastCount:=High(RQDDSCodesList.list);
  with sgRQDDSCodes do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQDDSCodesList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(RQDDSCodesList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := RQDDSCodesList.list[i].name;
        if RQDDSCodesList.list[i].isInvest = Low(Integer) then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := IntToStr(RQDDSCodesList.list[i].isInvest);
        if RQDDSCodesList.list[i].isActual = Low(Integer) then
          Cells[3,i+CurrentRow] := ''
        else
          Cells[3,i+CurrentRow] := IntToStr(RQDDSCodesList.list[i].isActual);
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgRQDDSCodes.Row:=CurrentRow-5;
   sgRQDDSCodes.RowCount:=LastRow+1;
  end;
  }
end;

procedure TfrmRQDDSCodesShow.sgRQDDSCodesDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgRQDDSCodes,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmRQDDSCodesShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgRQDDSCodes.RowCount-1 do
   for j:=0 to sgRQDDSCodes.ColCount-1 do
     sgRQDDSCodes.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmRQDDSCodesShow.actViewExecute(Sender: TObject);
Var TempRQDDSCodes: RQDDSCodesControllerSoapPort;
begin
 TempRQDDSCodes := HTTPRIORQDDSCodes as RQDDSCodesControllerSoapPort;
   try
     RQDDSCodesObj := TempRQDDSCodes.getObject(StrToInt(sgRQDDSCodes.Cells[0,sgRQDDSCodes.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQDDSCodesEdit:=TfrmRQDDSCodesEdit.Create(Application, dsView);
  try
    frmRQDDSCodesEdit.ShowModal;
  finally
    frmRQDDSCodesEdit.Free;
    frmRQDDSCodesEdit:=nil;
  end;
end;

procedure TfrmRQDDSCodesShow.actEditExecute(Sender: TObject);
Var TempRQDDSCodes: RQDDSCodesControllerSoapPort;
begin
 TempRQDDSCodes := HTTPRIORQDDSCodes as RQDDSCodesControllerSoapPort;
   try
     RQDDSCodesObj := TempRQDDSCodes.getObject(StrToInt(sgRQDDSCodes.Cells[0,sgRQDDSCodes.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQDDSCodesEdit:=TfrmRQDDSCodesEdit.Create(Application, dsEdit);
  try
    if frmRQDDSCodesEdit.ShowModal= mrOk then
      begin
        //TempRQDDSCodes.save(RQDDSCodesObj);
        UpdateGrid(Sender);
      end;
  finally
    frmRQDDSCodesEdit.Free;
    frmRQDDSCodesEdit:=nil;
  end;
end;

procedure TfrmRQDDSCodesShow.actDeleteExecute(Sender: TObject);
Var TempRQDDSCodes: RQDDSCodesControllerSoapPort;
  ObjCode: Integer;
begin
 TempRQDDSCodes := HTTPRIORQDDSCodes as RQDDSCodesControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQDDSCodes.Cells[0,sgRQDDSCodes.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Довідник кодів ДДС (шифри затрат)) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQDDSCodes.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmRQDDSCodesShow.actInsertExecute(Sender: TObject);
Var TempRQDDSCodes: RQDDSCodesControllerSoapPort;
begin
  TempRQDDSCodes := HTTPRIORQDDSCodes as RQDDSCodesControllerSoapPort;
  RQDDSCodesObj:=RQDDSCodes.Create;



  try
    frmRQDDSCodesEdit:=TfrmRQDDSCodesEdit.Create(Application, dsInsert);
    try
      if frmRQDDSCodesEdit.ShowModal = mrOk then
      begin
        if RQDDSCodesObj<>nil then
            //TempRQDDSCodes.add(RQDDSCodesObj);
            UpdateGrid(Sender);
      end;
    finally
      frmRQDDSCodesEdit.Free;
      frmRQDDSCodesEdit:=nil;
    end;
  finally
    RQDDSCodesObj.Free;
  end;
end;

procedure TfrmRQDDSCodesShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmRQDDSCodesShow.actFilterExecute(Sender: TObject);
begin
{frmRQDDSCodesFilterEdit:=TfrmRQDDSCodesFilterEdit.Create(Application, dsEdit);
  try
    RQDDSCodesFilterObj := RQDDSCodesFilter.Create;
    SetNullIntProps(RQDDSCodesFilterObj);
    SetNullXSProps(RQDDSCodesFilterObj);

    if frmRQDDSCodesFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := RQDDSCodesFilter.Create;
      FilterObject := RQDDSCodesFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmRQDDSCodesFilterEdit.Free;
    frmRQDDSCodesFilterEdit:=nil;
  end;}
end;

procedure TfrmRQDDSCodesShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

procedure TfrmRQDDSCodesShow.tvDDSCodesDblClick(Sender: TObject);
var
  f,f1 : RQDDSCodesFilter;
  c : RQDDSCodesControllerSoapPort;
  ddsCodesList, tmpList : RQDDSCodesShortList;
  i : Integer;
  tn : TTreeNode;
  isInvest : String;
begin
  inherited;

  c := HTTPRIORQDDSCodes as RQDDSCodesControllerSoapPort;

  if tvDDSCodes.Selected <> nil then
  begin
    f := RQDDSCodesFilter.Create;
    SetNullIntProps(f);
    SetNullXSProps(f);
    f.isActual := 1;
    f.parentDDSCodesRef := RQDDSCodesRef.Create;
    f.parentDDSCodesRef.code := RQDDSCodesShort(tvDDSCodes.Selected.Data).code;
    tvDDSCodes.Selected.DeleteChildren;

    ddsCodesList := c.getScrollableFilteredList(f,0,-1);
  end
  else begin
    if FilterObject = nil then
    begin
       FilterObject := RQDDSCodesFilter.Create;
       SetNullIntProps(FilterObject);
       SetNullXSProps(FilterObject);
       RQDDSCodesFilter(FilterObject).isActual := 1;
       RQDDSCodesFilter(FilterObject).conditionSQL := 'q1.PARENTDDSCODESREFCODE is null';
    end;

    ddsCodesList := c.getScrollableFilteredList(RQDDSCodesFilter(FilterObject),0,-1);
  end;

  for i:=0 to High(ddsCodesList.list) do
  begin
        if  ddsCodesList.list[i].isInvest = 1 then
           isInvest := 'Так'
        else
           isInvest := 'Ні';

      tn := tvDDSCodes.Items.AddChild(tvDDSCodes.Selected, ddsCodesList.list[i].txtCode + ';;;;;' + ddsCodesList.list[i].name + ';;;;;' + isInvest );
      tn.Data := ddsCodesList.list[i];
      f1 := RQDDSCodesFilter.Create;
      SetNullIntProps(f1);
      SetNullXSProps(f1);
      f1.parentDDSCodesRef := RQDDSCodesRef.Create;
      f1.parentDDSCodesRef.code := ddsCodesList.list[i].code;
      tmpList := c.getScrollableFilteredList(f1,0,-1);
      tn.HasChildren := tmpList.totalCount > 0;
      //tmpList := c.getscrol
  end;

  if tvDDSCodes.Selected <> nil then
    tvDDSCodes.Selected.Expand(false);

  {

   tvDep.Selected.DeleteChildren;

  ENDepartmentList := c.getScrollableFilteredList(f,0, -1);

  for i:=0 to High(ENDepartmentList.list) do
  begin
         tn := tvDep.Items.AddChild(tvDep.Selected, ENDepartmentList.list[i].shortName);
         //tn := tvDep.Items.AddChild(tvDep.Selected, AnsiReplaceText(ENDepartmentList.list[i].shortName, ';', '/'));

         tn.Data := ENDepartmentList.list[i];

         f1 := ENDepartmentFilter.Create;
         f1.parentRef := ENDepartmentRef.Create;
         SetNullIntProps(f1);
         SetNullXSProps(f1);
         f1.parentRef := ENDepartmentRef.Create;
         f1.parentRef.code := ENDepartmentList.list[i].code;

         tempList := c.getScrollableFilteredList(f1,0, -1);
         //if tempList.totalCount > 0 then
         tn.HasChildren := tempList.totalCount > 0;
  end;
  tvDep.Selected.Expand(false);
 //showmessage(ENDepartmentShort(tvDep.Selected.Data).typeRefName);
  }
end;

procedure TfrmRQDDSCodesShow.actSelectExecute(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      if tvDDSCodes.Selected <> nil then
        //if tvDep.Selected.Parent <> nil then
          temp:=  RQDDSCodesShort(tvDDSCodes.Selected.Data).code
        //else
        //   exit
      else
         exit;
    except
       Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

end.